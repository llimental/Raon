//
//  OnboardingFirstView.swift
//  SeoulCultureMoa
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
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("What's\nin\nSeoul")
                        .font(.system(size: 60))
                        .padding(.vertical, 30)

                    Text("서울시 문화프로그램 정보를 한눈에")
                        .font(.system(size: 15))
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
        .background(Color(themeColor.rawValue))
    }
}

#Preview {
    OnboardingFirstView(selectedTab: .constant(0),
                        themeColor: .constant(.pink))
}
