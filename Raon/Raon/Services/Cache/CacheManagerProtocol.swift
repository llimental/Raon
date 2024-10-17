//
//  CacheManagerProtocol.swift
//  Raon
//
//  Created by Lust3r on 10/17/24.
//

import UIKit.UIImage
import Combine

protocol CacheManagerProtocol {
    func fetchImage(from urlString: String) -> AnyPublisher<UIImage?, Never>
}
