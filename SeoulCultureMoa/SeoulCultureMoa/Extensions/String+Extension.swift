//
//  String+Extension.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/16/24.
//

import Foundation

extension String {
    func removeTimeStamp() -> String {
        return self.replacingOccurrences(of: " 00:00:00.0", with: "")
    }
}
