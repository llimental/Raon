//
//  NetworkManager.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/30/24.
//

import Foundation
import Combine

final class NetworkManager: ObservableObject {
    @Published var contents = [Content]()

    private var programCancellable: AnyCancellable?

    init() {
        requestProgramContents(from: 1, to: 10)
    }

    func requestProgramContents(from: Int, to: Int) {
        programCancellable?.cancel()

        guard let url = makeURL(startIndex: from, endIndex: to) else { return }

        programCancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .map(\.data)
            .decode(type: ProgramData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] value in
                self?.contents = value.programEvent.contents
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