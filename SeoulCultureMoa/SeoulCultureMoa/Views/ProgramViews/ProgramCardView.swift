//
//  ProgramCardView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import SwiftUI

struct ProgramCardView: View {
    @Binding var themeColor: ThemeColors

    let programTitle: String
    let programImageURL: String

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: programImageURL),
                content: { image in
                    image.resizable()
                },
                placeholder: {
                    ProgressView()
                })
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 15))
            .padding(.bottom, 20)

            Text(programTitle)
                .font(.title3)
                .fontWeight(.bold)
                .allowsTightening(true)
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .padding(.bottom, 50)

            ProgramCardButtons(themeColor: $themeColor)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color(themeColor.rawValue))
                .shadow(color: .primary, radius: 3, x: 7, y: 7)
                .opacity(0.2)
        )
    }
}

#Preview {
    ProgramCardView(
        themeColor: .constant(.pink),
        programTitle: "프로그램 제목",
        programImageURL: ""
    )
}
