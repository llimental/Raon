//
//  Date+Extension.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/2/24.
//

import Foundation

extension Date {
    func getStringOfTodayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: self)
    }

    func getKSTDate() -> Date {
        return self.addingTimeInterval(60 * 60 * 9)
    }
}
