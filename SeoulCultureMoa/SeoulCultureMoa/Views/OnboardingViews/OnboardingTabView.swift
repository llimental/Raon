//
//  OnboardingTabView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    @Binding var themeColor: ThemeColors

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingFirstView(
                selectedTab: $selectedTab,
                themeColor: $themeColor)
            .tag(0)
            OnboardingSecondView(selectedTab: $selectedTab,
                                 themeColor: $themeColor)
            .tag(1)
            OnboardingThirdView(isFirstLaunching: $isFirstLaunching,
                                themeColor: $themeColor)
            .tag(2)
        }
        .tabViewStyle(
            .page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingTabView(isFirstLaunching: .constant(true),
                      themeColor: .constant(.pink))
}
