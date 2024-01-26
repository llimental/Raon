//
//  OnboardingThirdView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    @Binding var isFirstLaunching: Bool
    @Binding var themeColor: ThemeColors

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                Text("반갑습니다!")
                    .font(.title)
                    .foregroundStyle(Color(themeColor.rawValue))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                Text("다양한 문화행사 정보를 둘러보세요")
                    .font(.callout)
                    .padding(.bottom, 40)

                Spacer()

                ColoredButton(
                    buttonAction: {
                        isFirstLaunching.toggle()
                    },
                    buttonText: "확인",
                    buttonColor: themeColor,
                    buttonWidth: geometry.size.width * 0.7)
            }
            .padding()
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    OnboardingThirdView(isFirstLaunching: .constant(true),
                        themeColor: .constant(.pink)
    )
}
