//
//  InvertedButton.swift
//  Raon
//
//  Created by Lust3r on 1/26/24.
//

import SwiftUI

struct InvertedButton: View {
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
                .foregroundStyle(buttonColor.color)
                .padding()
                .frame(
                    width: buttonWidth,
                    height: buttonHeight)
                .background(.white)
                .clipShape(.rect(cornerRadius: 15))
        })
    }
}

#Preview {
    InvertedButton(
        buttonAction: { },
        buttonText: "Button",
        buttonColor: .pink)
}
