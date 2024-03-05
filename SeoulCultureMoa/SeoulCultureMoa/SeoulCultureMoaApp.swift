//
//  SeoulCultureMoaApp.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/16/24.
//

import SwiftUI

@main
struct SeoulCultureMoaApp: App {
    // MARK: - @AppStorage Properties
    @AppStorage("isFirstLaunching") private var isFirstLaunching: Bool = true
    @AppStorage("ThemeColor") var themeColor: ThemeColors = .blue
    @AppStorage("SelectedRegion") var selectedRegion: Regions = .allRegion

    // MARK: - Initializer
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView(
                isFirstLaunching: $isFirstLaunching,
                themeColor: $themeColor,
                selectedRegion: $selectedRegion)
            .tint(Color(themeColor.rawValue))
        }
    }
}
