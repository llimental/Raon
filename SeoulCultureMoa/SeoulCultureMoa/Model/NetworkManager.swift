//
//  NetworkManager.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/30/24.
//

import Foundation
import Combine

final class NetworkManager: ObservableObject {
    @Published var contents = [ProgramContent]()

    private var programCancellable: AnyCancellable?

    init() {
        requestProgramContents()
    }

    deinit {
        programCancellable?.cancel()
    }

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

    private func makeURL(startIndex: Int, endIndex: Int) -> URL? {
        var components = URLComponents()

        components.scheme = "http"
        components.host = "openapi.seoul.go.kr"
        components.port = 8088
        components.path = "/json/culturalEventInfo/\(startIndex)/\(endIndex)/"

        return components.url
    }
}
