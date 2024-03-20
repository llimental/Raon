//
//  CacheManager.swift
//  Raon
//
//  Created by Lust3r on 3/6/24.
//

import UIKit.UIImage

final class CacheManager {
    // MARK: - Singleton Pattern
    static let shared = CacheManager()

    // MARK: - Initializer
    private init() { }

    // MARK: - Private Properties
    private var cache = NSCache<NSString, UIImage>()

    // MARK: - Public Functions
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(cachedImage)
        } else {
            guard let url = URL(string: urlString) else {
                completion(nil)

                return
            }

            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil)

                    return
                }

                self.cache.setObject(image, forKey: urlString as NSString)

                completion(image)
            }.resume()
        }
    }
}
