//
//  NetworkMonitor.swift
//  Raon
//
//  Created by Lust3r on 10/22/24.
//

import Combine
import Network

/// 네트워크 상태를 모니터링하는 클래스
final class NetworkMonitor {
    // MARK: - Singleton Pattern
    static let shared = NetworkMonitor()

    // MARK: - @Published Properties
    @Published var isConnected: Bool = false

    // MARK: - Private Properties
    private let networkMonitor = NWPathMonitor()

    // MARK: - LifeCycle
    private init() {
        startMonitoring()
    }

    deinit {
        networkMonitor.cancel()
    }

    // MARK: - Private Functions
    private func startMonitoring() {
        networkMonitor.start(queue: .global())

        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async { [weak self] in
                self?.isConnected = path.status == .satisfied
            }
        }
    }
}
