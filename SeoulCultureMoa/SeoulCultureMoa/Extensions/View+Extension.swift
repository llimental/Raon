//
//  View+Extension.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
