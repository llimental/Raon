//
//  ColoredText.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/26/24.
//

import SwiftUI

struct ColoredText: View {
    // MARK: - Public Properties
    let text: String
    let textColor: ThemeColors

    var textWidth: CGFloat? = nil
    var textHeight: CGFloat? = nil

    // MARK: - Body
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .frame(
                width: textWidth,
                height: textHeight)
            .background(Color(textColor.rawValue))
            .clipShape(.rect(cornerRadius: 15))
    }
}


#Preview {
    ColoredText(
        text: "ColoredText",
        textColor: .pink)
}
