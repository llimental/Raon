//
//  RoundedCorner.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/24/24.
//

import SwiftUI

struct RoundedCorner: Shape {
    // MARK: - Public Properties
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    // MARK: - Public Functions
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius))

        return Path(path.cgPath)
    }
}
