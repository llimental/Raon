//
//  ContentView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunching") private var isFirstLaunching: Bool = true
    @AppStorage("ThemeColor") var themeColor: ThemeColors = .pink
    @AppStorage("SelectedRegion") var selectedRegion: Regions = .전체보기

    var body: some View {
        TabView(content: {
            ProgramView()
                .tabItem {
                    Label("프로그램", systemImage: "house")
                }
        })
        .tint(Color(themeColor.rawValue))
        .fullScreenCover(isPresented: $isFirstLaunching) {
            OnboardingTabView(isFirstLaunching: $isFirstLaunching,
                              themeColor: $themeColor,
                              selectedRegion: $selectedRegion)
        }
    }
}

#Preview {
    ContentView()
}
