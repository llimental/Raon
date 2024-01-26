//
//  OnboardingTabView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/23/24.
//

import SwiftUI

struct OnboardingTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingFirstView()
                .tag(0)
            OnboardingSecondView()
                .tag(1)
            OnboardingThirdView()
                .tag(2)
        }
        .tabViewStyle(
            .page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingTabView()
}
