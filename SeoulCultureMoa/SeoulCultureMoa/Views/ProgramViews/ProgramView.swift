//
//  ProgramView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/27/24.
//

import SwiftUI

struct ProgramView: View {
    // MARK: - @EnvironmentObject Properties
    @EnvironmentObject var networkManager: NetworkManager

    // MARK: - @State Properties
    @State private var selectedTab = String()

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors
    @Binding var selectedRegion: Regions

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                NavigationBarLargeTitleView(
                    titleText: "프로그램",
                    themeColor: themeColor)

                ZStack(alignment: .bottom) {
                    TabView(selection: $selectedTab) {
                        ForEach(getFilteredContents(), id: \.title) { content in
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
                    .padding()
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            Button("", systemImage: "arrow.clockwise") {
                                networkManager.requestProgramContents()
                                selectedTab = String()
                            }

                            NavigationLink {
                                CalendarView(
                                    contents: $networkManager.contents,
                                    themeColor: $themeColor)
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
                    .onChange(of: selectedRegion) { _, _ in
                        selectedTab = String()
                    }

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

    // MARK: - Private Functions
    private func getFilteredContents() -> [ProgramContentModel] {
        if selectedRegion == .allRegion {
            return networkManager.contents
        } else {
            return networkManager.contents.filter { $0.region == selectedRegion.rawValue }
        }
    }
}

#Preview {
    ProgramView(
        themeColor: .constant(.pink),
        selectedRegion: .constant(.allRegion))
    .environmentObject(NetworkManager())
}
