//
//  ColoredButton.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/26/24.
//

import SwiftUI

struct ColoredButton: View {
    let buttonAction: () -> Void
    let buttonText: String
    let buttonColor: ThemeColors

    var buttonWidth: CGFloat? = nil
    var buttonHeight: CGFloat? = nil

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
                .background(Color(buttonColor.rawValue))
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
