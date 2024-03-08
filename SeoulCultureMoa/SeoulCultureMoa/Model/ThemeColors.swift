//
//  ThemeColors.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/27/24.
//

import SwiftUI

enum ThemeColors: String, ShapeStyle, CaseIterable {
    case pink = "Pink"
    case blue = "Blue"

    var color: Color {
        switch self {
            case .pink:
                return .pink
            case .blue:
                return .blue
        }
    }
}
