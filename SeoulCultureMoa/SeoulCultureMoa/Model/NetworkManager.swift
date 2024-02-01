//
//  NetworkManager.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/30/24.
//

import Foundation
import Combine
import Network

final class NetworkManager: ObservableObject {
    // MARK: - Published Properties
    @Published var contents = [ProgramContent]()
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

    // MARK: - Public Functions
    func requestProgramContents() {
        programCancellable?.cancel()

        let today = Date().getStringOfTodayDate()

        guard let url = makeURL(startIndex: 1, endIndex: 1000) else { return }

        programCancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .map(\.data)
            .decode(type: ProgramData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] value in
                self?.contents = value.programInfo.programContents.filter { $0.endDate > today }.sorted { $0.startDate < $1.startDate }
            }
    }

    // MARK: - Private Functions
    private func makeURL(startIndex: Int, endIndex: Int) -> URL? {
        var components = URLComponents()

        components.scheme = "http"
        components.host = "openapi.seoul.go.kr"
        components.port = 8088
        components.path = "/json/culturalEventInfo/\(startIndex)/\(endIndex)/"

        return components.url
    }

    private func startNetworkMonitoring() {
        networkMonitor.start(queue: .global())

        self.networkMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.currentNetworkStatus = path.status == .satisfied
            }
        }
    }
}
