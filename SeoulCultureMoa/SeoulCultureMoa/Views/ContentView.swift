//
//  ContentView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - @EnvironmentObject
    @EnvironmentObject var networkManager: NetworkManager

    // MARK: - @Binding Properties
    @Binding var isFirstLaunching: Bool
    @Binding var themeColor: ThemeColors
    @Binding var selectedRegion: Regions

    // MARK: - Body
    var body: some View {
        if isFirstLaunching {
            OnboardingTabView(isFirstLaunching: $isFirstLaunching,
                              themeColor: $themeColor,
                              selectedRegion: $selectedRegion)
        } else {
            TabView {
                ProgramView(
                    themeColor: $themeColor,
                    selectedRegion: $selectedRegion)
                .tabItem {
                    Label("프로그램", systemImage: "house")
                }

                FavoritesView()
                    .tabItem {
                        Label("즐겨찾기", systemImage: "heart")
                    }

                SearchView(
                    contents: $networkManager.contents,
                    themeColor: $themeColor)
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
            }
        }
    }
}

#Preview {
    ContentView(
        isFirstLaunching: .constant(false),
        themeColor: .constant(.pink),
        selectedRegion: .constant(.allRegion))
    .environmentObject(NetworkManager())
}
