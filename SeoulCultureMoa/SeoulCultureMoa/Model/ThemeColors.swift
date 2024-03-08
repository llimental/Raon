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
    case purple = "Purple"
    case indigo = "Indigo"

    var color: Color {
        switch self {
            case .pink:
                return .pink
            case .blue:
                return .blue
            case .purple:
                return .purple
            case .indigo:
                return .indigo
        }
    }
}
