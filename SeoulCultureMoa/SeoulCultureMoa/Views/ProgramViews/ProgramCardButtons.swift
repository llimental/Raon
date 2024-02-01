//
//  ProgramCardButtons.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/30/24.
//

import SwiftUI

struct ProgramCardButtons: View {
    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {

            }, label: {
                Image(systemName: "heart")
                    .font(.system(size: 30))
            })

            ColoredButton(
                buttonAction: {

                },
                buttonText: "바로가기",
                buttonColor: themeColor,
                buttonWidth: 150
            )

            Button(action: {

            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 30))
            })
        }
        .foregroundStyle(Color(themeColor.rawValue))
    }
}
