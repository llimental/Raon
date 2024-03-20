//
//  SettingsView.swift
//  Raon
//
//  Created by Lust3r on 3/8/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - @EnvironmentObject Properties
    @EnvironmentObject var notificationManager: NotificationManager

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors
    @Binding var selectedRegion: Regions

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBarLargeTitleView(
                titleText: "설정",
                themeColor: themeColor)

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
                .listRowSeparator(.hidden)

                Section {
                    NotificationToggleView(isToggleOn: $notificationManager.notificationStatus)

                    ThemeSettingView(themeColor: $themeColor)

                    Picker(selection: $selectedRegion) {
                        ForEach(Regions.allCases) { region in
                            Text(region.rawValue)
                        }
                    } label: {
                        Label("관심지역", systemImage: "map")
                    }
                    .tint(.white)
                    .colorMultiply(themeColor.color)
                } header: {
                    Text("개인화")
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    SettingsView(
        themeColor: .constant(.pink),
        selectedRegion: .constant(.allRegion))
    .environmentObject(NotificationManager())
}
