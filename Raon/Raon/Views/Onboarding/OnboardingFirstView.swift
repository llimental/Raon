//
//  OnboardingFirstView.swift
//  Raon
//
//  Created by Lust3r on 1/19/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    // MARK: - @Binding Properties
    @Binding var selectedTab: Int
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                VStack(spacing: 20) {
                    Image("Raon")

                    Text("라온")
                        .font(.largeTitle)
                        .bold()

                    Text("서울시 문화행사 정보 안내 서비스")
                }
                .foregroundStyle(.white)

                Spacer()

                InvertedButton(
                    buttonAction: {
                        selectedTab += 1
                    },
                    buttonText: "시작하기",
                    buttonColor: themeColor,
                    buttonWidth: geometry.size.width * 0.7)
            }
            .padding()
            .frame(width: geometry.size.width)
        }
        .padding(.vertical)
        .background(themeColor.color)
    }
}

#Preview {
    OnboardingFirstView(selectedTab: .constant(0),
                        themeColor: .constant(.pink))
}
