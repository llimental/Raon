//
//  ProgramView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/27/24.
//

import SwiftUI

struct ProgramView: View {
    // MARK: - @EnvironmentObject
    @EnvironmentObject var networkManager: NetworkManager

    // MARK: - @State Properties
    @State private var selectedTab = String()

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors
    @Binding var selectedRegion: Regions

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    ForEach(networkManager.contents, id: \.title) { content in
                        NavigationLink {
                            ProgramDetailView(
                                themeColor: $themeColor,
                                content: content)
                        } label: {
                            ProgramCardView(programImageURL: content.imageURL)
                        }
                        .tag(content.title)
                        .padding()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .navigationTitle("프로그램")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("", systemImage: "arrow.clockwise") {
                            networkManager.requestProgramContents()
                            selectedTab = String()
                        }

                        NavigationLink {

                        } label: {
                            Image(systemName: "calendar")
                        }

                        NavigationLink {
                            SettingsView(
                                themeColor: $themeColor,
                                selectedRegion: $selectedRegion)
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
                .padding()

                if !networkManager.currentNetworkStatus {
                    Text("인터넷 연결 상태가 좋지 않습니다")
                        .padding()
                        .foregroundStyle(.white)
                        .background(
                            Capsule()
                                .foregroundStyle(.gray)
                        )
                        .padding(.bottom, 5)
                }
            }
        }
    }
}

#Preview {
    ProgramView(
        themeColor: .constant(.pink),
        selectedRegion: .constant(.allRegion))
        .environmentObject(NetworkManager())
}
