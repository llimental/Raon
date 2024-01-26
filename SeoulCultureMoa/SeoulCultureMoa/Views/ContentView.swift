//
//  ContentView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunching") private var isFirstLaunching: Bool = true

    var body: some View {
        Text("App Main")
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingTabView()
            }
    }
}

#Preview {
    ContentView()
}
