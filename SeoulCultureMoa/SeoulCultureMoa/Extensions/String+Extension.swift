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

    func getDateOfString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: self) else { return Date() }

        return date.getKSTDate()
    }
}
