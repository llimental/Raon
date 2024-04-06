//
//  ProgramView.swift
//  Raon
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
    @Binding var programPath: [DestinationPath]

    // MARK: - Body
    var body: some View {
        NavigationStack(path: $programPath) {
            VStack(alignment: .leading) {
                NavigationBarLargeTitleView(
                    titleText: "프로그램",
                    themeColor: themeColor)

                ZStack(alignment: .bottom) {
                    TabView(selection: $selectedTab) {
                        ForEach(getFilteredContents(), id: \.title) { content in
                            NavigationLink(value: DestinationPath.detail(content)) {
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

                            NavigationLink(value: DestinationPath.calendar) {
                                Image(systemName: "calendar")
                            }

                            NavigationLink(value: DestinationPath.settings) {
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
            .navigationDestination(for: DestinationPath.self) { destination in
                switch destination {
                    case .detail(let content): ProgramDetailView(themeColor: $themeColor, content: content)
                    case .calendar: CalendarView(contents: $networkManager.contents, themeColor: $themeColor)
                    case .settings: SettingsView(themeColor: $themeColor, selectedRegion: $selectedRegion)
                }
            }
            .fullScreenCover(isPresented: $networkManager.isContentsUpdating, content: {
                ProgressView {
                    Text("데이터를 불러오는 중입니다\n잠시만 기다려주세요")
                        .multilineTextAlignment(.center)
                }
                .presentationBackground(.ultraThinMaterial)
            })
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
        selectedRegion: .constant(.allRegion),
        programPath: .constant([]))
    .environmentObject(NetworkManager())
}
