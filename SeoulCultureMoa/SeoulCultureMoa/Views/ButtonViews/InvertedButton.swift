//
//  InvertedButton.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/26/24.
//

import SwiftUI

struct InvertedButton: View {
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
                .foregroundStyle(Color(buttonColor.rawValue))
                .padding()
                .frame(width: buttonWidth, height: buttonHeight)
                .background(.white)
                .clipShape(.buttonBorder)
        })
    }
}

#Preview {
    InvertedButton(
        buttonAction: { },
        buttonText: "Button",
        buttonColor: .pink
    )
}
