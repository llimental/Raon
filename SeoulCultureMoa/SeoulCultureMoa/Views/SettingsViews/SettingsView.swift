//
//  SettingsView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/8/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors
    @Binding var selectedRegion: Regions

    // MARK: - Body
    var body: some View {
        List {
            Section {
                NavigationLink {
                    CopyRightView()
                } label: {
                    Label("저작권", systemImage: "doc")
                }

                Label("문의하기", systemImage: "bubble.left.and.text.bubble.right")
            } header: {
                Text("정보")
            }

            Section {
                Label("앱 색상", systemImage: "paintbrush")
                Label("관심지역", systemImage: "map")
            } header: {
                Text("개인화")
            }

        }
        .listStyle(.plain)
        .navigationTitle("설정")
    }
}

#Preview {
    SettingsView(
        themeColor: .constant(.pink),
        selectedRegion: .constant(.allRegion))
}
