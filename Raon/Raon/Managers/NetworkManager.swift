//
//  NetworkManager.swift
//  Raon
//
//  Created by Lust3r on 1/30/24.
//

import Foundation
import Combine
import Network

final class NetworkManager: ObservableObject {
    // MARK: - @Published Properties
    @Published var contents = [ProgramContentModel]()
    @Published var currentNetworkStatus = true

    // MARK: - LifeCycle
    init() {
        startNetworkMonitoring()
        requestProgramContents()
    }

    deinit {
        programCancellable?.cancel()
        networkMonitor.cancel()
    }

    // MARK: - Private Properties
    private var programCancellable: AnyCancellable?
    private let networkMonitor = NWPathMonitor()

    /// API에서 받아와야 하는 전체 데이터 수
    private var totalCount = 0
    /// API에서 받아온 전체 데이터. totalCount와 수가 맞을 때 transformDTO(from:)에 데이터 전달
    private var rawContents = [ProgramContent]() {
        didSet {
            if rawContents.count == totalCount {
                transformDTO(from: rawContents)
            }
        }
    }

    // MARK: - Public Functions
    func requestProgramContents() {
        if currentNetworkStatus {
            programCancellable?.cancel()
            contents.removeAll()
            rawContents.removeAll()

            guard let url = makeURL(startIndex: 1, endIndex: 1) else { return }

            programCancellable = URLSession.shared
                .dataTaskPublisher(for: url)
                .subscribe(on: DispatchQueue.global())
                .map(\.data)
                .decode(type: ProgramData.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    print(completion)
                } receiveValue: { [weak self] value in
                    self?.totalCount = value.programInfo.totalCount
                    self?.getTotalContents(of: value.programInfo.totalCount)
                }
        }
    }

    // MARK: - Private Functions
    private func startNetworkMonitoring() {
        networkMonitor.start(queue: .global())

        self.networkMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                if self?.currentNetworkStatus == false && path.status == .satisfied {
                    self?.requestProgramContents()
                }

                self?.currentNetworkStatus = path.status == .satisfied
            }
        }
    }

    private func makeURL(startIndex: Int, endIndex: Int) -> URL? {
        var components = URLComponents()

        components.scheme = "http"
        components.host = "openapi.seoul.go.kr"
        components.port = 8088
        components.path = "/json/culturalEventInfo/\(startIndex)/\(endIndex)/"

        return components.url
    }

    /// Publishers.MergeMany를 사용하여 유동적인 횟수만큼 API를 호출하는 메서드. 전달받은 수에 비례한 Publisher를 생성하고 MergeMany로 결합하여 전체 데이터 핸들링
    private func getTotalContents(of amount: Int) {
        let count = (amount + 999) / 1000

        var publishers = [URLSession.DataTaskPublisher]()

        /*
         API 호출 시 인덱스 변화 로직
         1회(0): 1...1000 = 0 * 1000 + 1...0 * 1000 + 1000
         2회(1): 1001...2000 = 1 * 1000 + 1...1 * 1000 + 1000
         3회(2): 2001...3000 = 2 * 1000 + 1...2 * 1000 + 1000

         => n회(n): (n * 1000) + 1 ~ (n * 1000) + 1000
         */

        for index in 0..<count {
            guard let url = makeURL(startIndex: (index * 1000) + 1, endIndex: (index * 1000) + 1000) else { return }

            let publisher = URLSession.shared
                .dataTaskPublisher(for: url)

            publishers.append(publisher)
        }

        programCancellable = Publishers.MergeMany(publishers)
            .subscribe(on: DispatchQueue.global())
            .map(\.data)
            .decode(type: ProgramData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { value in
                self.rawContents.append(contentsOf: value.programInfo.programContents)
            }
    }

    private func transformDTO(from contents: [ProgramContent]) {
        let today = Date().getStringOfTodayDate()

        self.contents = contents
            .filter { $0.endDate > today }
            .sorted { $0.startDate < $1.startDate }
            .map { content in
                ProgramContentModel(
                    category: content.category,
                    region: content.region,
                    title: content.title,
                    place: content.place,
                    organization: content.organization,
                    target: content.target,
                    fees: content.fees,
                    url: content.url,
                    imageURL: content.imageURL,
                    startDate: content.startDate.removeTimeStamp(),
                    endDate: content.endDate.removeTimeStamp(),
                    longitude: content.longitude,
                    latitude: content.latitude,
                    isFree: content.isFree
                )
            }
    }
}
