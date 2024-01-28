//
//  ProgramCardView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import SwiftUI

struct ProgramCardView: View {
    @Binding var themeColor: ThemeColors

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 250, height: 350)
                .foregroundStyle(Color(themeColor.rawValue))
                .clipShape(.rect(cornerRadius: 15))
                .padding(.bottom, 20)

            Text("프로그램 제목")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            Text("프로그램 내용")
                .font(.body)
                .foregroundStyle(.gray)
                .padding(.bottom, 50)

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
}

#Preview {
    ProgramCardView(themeColor: .constant(.pink))
}
