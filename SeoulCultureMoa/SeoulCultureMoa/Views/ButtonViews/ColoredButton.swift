//
//  ColoredButton.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/26/24.
//

import SwiftUI

struct ColoredButton: View {
    // MARK: - Public Properties
    let buttonAction: () -> Void
    let buttonText: String
    let buttonColor: ThemeColors

    var buttonWidth: CGFloat? = nil
    var buttonHeight: CGFloat? = nil

    // MARK: - Body
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            Text(buttonText)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .frame(
                    width: buttonWidth,
                    height: buttonHeight)
                .background(buttonColor.color)
                .clipShape(.rect(cornerRadius: 15))
        })
    }
}

#Preview {
    ColoredButton(
        buttonAction: { },
        buttonText: "Button",
        buttonColor: .pink)
}
