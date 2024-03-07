//
//  SettingsView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/8/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    CopyRightView()
                } label: {
                    Text("저작권")
                }

                Text("문의하기")
            } header: {
                Text("정보")
            }

            Section {
                Text("테마")
                Text("관심지역")
            } header: {
                Text("개인화")
            }

        }
        .listStyle(.plain)
        .navigationTitle("설정")
    }
}

#Preview {
    SettingsView()
}
