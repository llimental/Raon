//
//  OnboardingFirstView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/19/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("What's\nin\nSeoul")
                        .font(.system(size: 60))
                        .padding(EdgeInsets(
                            top: 100,
                            leading: 0,
                            bottom: 30,
                            trailing: 0))

                    Text("서울시 문화프로그램 정보를 한눈에")
                        .font(.system(size: 15))
                }
                .foregroundStyle(.white)

                Spacer()

                InvertedButton(
                    buttonAction: {

                    },
                    buttonText: "시작하기",
                    buttonColor: ThemeColors.pink,
                    buttonWidth: geometry.size.width * 0.7)
            }
            .padding()
            .frame(width: geometry.size.width)
        }
        .background(Color(ThemeColors.pink.rawValue))
    }
}

#Preview {
    OnboardingFirstView()
}
