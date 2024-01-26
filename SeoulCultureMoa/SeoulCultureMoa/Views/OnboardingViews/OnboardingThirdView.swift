//
//  OnboardingThirdView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                Text("반갑습니다!")
                    .font(.title)
                    .foregroundStyle(Color(ThemeColors.pink.rawValue))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                Text("다양한 문화행사 정보를 둘러보세요")
                    .font(.callout)
                    .padding(.bottom, 40)

                Spacer()

                ColoredButton(
                    buttonAction: {

                    },
                    buttonText: "확인",
                    buttonColor: ThemeColors.pink,
                    buttonWidth: geometry.size.width * 0.7)
            }
            .padding()
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    OnboardingThirdView()
}
