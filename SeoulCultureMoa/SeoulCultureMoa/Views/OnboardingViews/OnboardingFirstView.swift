//
//  OnboardingFirstView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/19/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()

            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Spacer()

                    VStack(alignment: .leading) {
                        Text("""
                             Seoul
                             Culture
                             Moa
                             """)
                        .font(.system(size: 50))

                        Rectangle()
                            .frame(height: 0)

                        Text("서울시 문화프로그램 정보를 한눈에")
                        .font(.body)
                    }
                    .foregroundStyle(.white)
                    .padding()

                    Spacer()
                    Spacer()
                    Spacer()

                    Button(action: {

                    }) {
                        Text("시작하기")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: geometry.size.width * 0.8)
                            .foregroundStyle(.pink)
                            .background(.white)
                            .clipShape(.buttonBorder)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingFirstView()
}
