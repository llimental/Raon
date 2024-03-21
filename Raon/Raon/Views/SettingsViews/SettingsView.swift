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

                    buildKakaoChatButton()

                    HStack {
                        Label("버전", systemImage: "apple.terminal")

                        Spacer()

                        Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0")
                            .foregroundStyle(.gray)
                    }
                } header: {
                    Text("정보")
                }
                .listRowSeparator(.hidden)

                Section {
                    NotificationToggleView(isToggleOn: $notificationManager.notificationStatus)

                    ThemeSettingView(themeColor: $themeColor)

                    HStack {
                        Label("관심지역", systemImage: "map")

                        Spacer()

                        Picker("Region Picker", selection: $selectedRegion) {
                            ForEach(Regions.allCases) { region in
                                Text(region.rawValue)
                            }
                        }
                        .tint(.white)
                        .colorMultiply(themeColor.color)
                        .labelsHidden()
                    }
                } header: {
                    Text("개인화")
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }

    // MARK: - Private Functions
    private func buildKakaoChatButton() -> some View {
        return Button(action: {
            guard let url = URL(string: "kakaoplus://plusfriend/chat/_MFlWG") else { return }

            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }, label: {
            Label("문의하기(카카오톡)", systemImage: "bubble.left.and.text.bubble.right")
        })
    }
}

#Preview {
    SettingsView(
        themeColor: .constant(.pink),
        selectedRegion: .constant(.allRegion))
    .environmentObject(NotificationManager())
}
