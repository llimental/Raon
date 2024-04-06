//
//  OnboardingThirdView.swift
//  Raon
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    // MARK: - @Binding Properties
    @Binding var selectedTab: Int
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 20) {
                Spacer()

                Image(systemName: "bell")
                    .font(Font.system(size: 70))
                    .foregroundStyle(themeColor.color)
                    .padding(.bottom, 30)

                Text("앱 내 권한 요청 안내")
                    .font(.title)
                    .foregroundStyle(themeColor.color)
                    .fontWeight(.bold)

                Text("즐겨찾기로 등록한 프로그램이\n아직 시작하지 않았다면,\n하루 전에 푸시 알림을 드려요\n\n허용하지 않으셔도 서비스 이용에\n문제없습니다(선택 권한)")
                    .font(.callout)
                    .multilineTextAlignment(.leading)

                Text("* 앱 내 설정에서도 변경 가능\n* 처음 프로그램 즐겨찾기 시 권한 요청")
                    .font(.footnote)
                    .foregroundStyle(.gray)

                Spacer()

                ColoredButton(
                    buttonAction: {
                        selectedTab += 1
                    },
                    buttonText: "다음",
                    buttonColor: themeColor,
                    buttonWidth: geometry.size.width * 0.7)
            }
            .padding()
            .frame(width: geometry.size.width)
        }
        .padding(.vertical)
    }
}

#Preview {
    OnboardingThirdView(selectedTab: .constant(1),
                         themeColor: .constant(.pink))
}
