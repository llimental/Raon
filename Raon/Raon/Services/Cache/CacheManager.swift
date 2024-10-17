//
//  CacheManager.swift
//  Raon
//
//  Created by Lust3r on 3/6/24.
//

import UIKit.UIImage
import Combine

final class CacheManager: CacheManagerProtocol {
    // MARK: - Singleton Pattern
    static let shared = CacheManager()

    // MARK: - Initializer
    private init() { }

    // MARK: - Private Properties
    private let cache = NSCache<NSString, UIImage>()
    private let urlSession = URLSession.shared

    // MARK: - Public Functions
    func fetchImage(from urlString: String) -> AnyPublisher<UIImage?, Never> {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            return Just(cachedImage)
                .eraseToAnyPublisher()
        } else {
            guard let url = URL(string: urlString) else {
                return Just(nil)
                    .eraseToAnyPublisher()
            }

            return urlSession.dataTaskPublisher(for: url)
                .map { [weak self] data, _ -> UIImage? in
                    let image = UIImage(data: data)

                    if let image = image {
                        self?.cache.setObject(image, forKey: urlString as NSString)
                    }

                    return image
                }
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
    }
}
