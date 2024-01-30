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

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 250, height: 350)
                .foregroundStyle(Color(themeColor.rawValue))
                .clipShape(.rect(cornerRadius: 15))
                .padding(.bottom, 20)

            Text(programTitle)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 50)
                .allowsTightening(true)

            ProgramCardButtons(themeColor: $themeColor)
        }
    }
}

#Preview {
    ProgramCardView(
        themeColor: .constant(.pink),
        programTitle: "프로그램 제목",
    )
}
