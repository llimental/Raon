//
//  OnboardingTabView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var themeColor: ThemeColors

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingFirstView(
                themeColor: $themeColor)
            .tag(0)
            OnboardingSecondView(
                themeColor: $themeColor)
            .tag(1)
            OnboardingThirdView(
                themeColor: $themeColor)
            .tag(2)
        }
        .tabViewStyle(
            .page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingTabView(themeColor: .constant(.pink))
}
