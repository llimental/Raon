//
//  OnboardingSecondView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingSecondView: View {
    @Binding var themeColor: ThemeColors

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("주로 정보를 얻고 싶은\n지역을 선택해주세요")
                    .font(.title)
                    .foregroundStyle(Color(themeColor.rawValue))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                Text("지역 상관없이 모두 보고 싶다면\n전체보기를 선택해주세요")
                    .font(.callout)
                    .padding(.bottom, 10)

                Text("* 앱 내 설정에서도 변경 가능")
                    .font(.footnote)
                    .foregroundStyle(.gray)

                Spacer()

                ColoredButton(
                    buttonAction: {

                    },
                    buttonText: "다음",
                    buttonColor: themeColor,
                    buttonWidth: geometry.size.width * 0.7)
            }
            .padding()
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    OnboardingSecondView(themeColor: .constant(.pink))
}
