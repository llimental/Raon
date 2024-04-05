//
//  OnboardingTabView.swift
//  Raon
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingTabView: View {
    // MARK: - @State Properties
    @State private var selectedTab = 0

    // MARK: - @Binding Properties
    @Binding var isFirstLaunching: Bool
    @Binding var themeColor: ThemeColors
    @Binding var selectedRegion: Regions

    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingFirstView(
                selectedTab: $selectedTab,
                themeColor: $themeColor)
            .tag(0)
            OnboardingSecondView(
                selectedTab: $selectedTab,
                themeColor: $themeColor,
                selectedRegion: $selectedRegion)
            .tag(1)
            .background(.white)
            OnboardingThirdView(
                isFirstLaunching: $isFirstLaunching,
                themeColor: $themeColor)
            .tag(2)
            .background(.white)
        }
        .background(themeColor.color)
        .tabViewStyle(
            .page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingTabView(isFirstLaunching: .constant(true),
                      themeColor: .constant(.pink),
                      selectedRegion: .constant(.allRegion))
}
