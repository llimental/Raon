//
//  ProgramView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/27/24.
//

import SwiftUI

struct ProgramView: View {
    // MARK: - @StateObject Properties
    @StateObject private var networkManager = NetworkManager()

    // MARK: - @State Properties
    @State private var selectedTab = String()

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

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
                            ProgramCardView(
                                programTitle: content.title,
                                programImageURL: content.imageURL
                            )
                        }
                        .tag(content.title)
                        .padding()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .navigationTitle("프로그램")
                .navigationBarTitleTextColor(Color(themeColor.rawValue))
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
                            SearchView(contents: $networkManager.contents)
                        } label: {
                            Image(systemName: "magnifyingglass")
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
        .tint(Color(themeColor.rawValue))
    }
}

#Preview {
    ProgramView(themeColor: .constant(.pink))
}
