//
//  ContentView.swift
//  Raon
//
//  Created by Lust3r on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - @EnvironmentObject Properties
    @EnvironmentObject var networkManager: NetworkManager

    // MARK: - @State Properties
    @State private var selectedTab: Tab = .program
    @State private var programPath: [DestinationPath] = []
    @State private var favoritesPath: [DestinationPath] = []
    @State private var searchPath: [DestinationPath] = []

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
                .tag(Tab.program)

                FavoritesView(
                    themeColor: $themeColor)
                .tabItem {
                    Label("즐겨찾기", systemImage: "heart")
                }
                .tag(Tab.favorites)

                SearchView(
                    contents: $networkManager.contents,
                    themeColor: $themeColor)
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            }
        }
    }

    // MARK: - Private Functions
    private func tabSelection() -> Binding<Tab> {
        Binding {
            self.selectedTab
        } set: { touchedTap in
            if touchedTap == self.selectedTab {
                switch touchedTap {
                    case .program:
                        if !programPath.isEmpty { programPath.removeAll() }
                    case .favorites:
                        if !favoritesPath.isEmpty { favoritesPath.removeAll() }
                    case .search:
                        if !searchPath.isEmpty { searchPath.removeAll() }
                }
            }

            self.selectedTab = touchedTap
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
