//
//  ContentView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - @AppStorage Properties
    @AppStorage("isFirstLaunching") private var isFirstLaunching: Bool = true
    @AppStorage("ThemeColor") var themeColor: ThemeColors = .pink
    @AppStorage("SelectedRegion") var selectedRegion: Regions = .allRegion

    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }

    // MARK: - Body
    var body: some View {
        if isFirstLaunching {
            OnboardingTabView(isFirstLaunching: $isFirstLaunching,
                              themeColor: $themeColor,
                              selectedRegion: $selectedRegion)
        } else {
            TabView {
                ProgramView(themeColor: $themeColor)
                    .tabItem {
                        Label("프로그램", systemImage: "house")
                    }
            }
            .tint(Color(themeColor.rawValue))
        }
    }
}

#Preview {
    ContentView()
}
