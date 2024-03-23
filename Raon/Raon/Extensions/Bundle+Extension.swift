//
//  Bundle+Extension.swift
//  Raon
//
//  Created by Lust3r on 3/22/24.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let url = Bundle.main.url(forResource: "RaonAPI", withExtension: "plist"),
              let plistDictionary = try? NSDictionary(contentsOf: url, error: ()) else { return String() }

        guard let key = plistDictionary["API_KEY"] as? String else { return String() }

        return key
    }
}
