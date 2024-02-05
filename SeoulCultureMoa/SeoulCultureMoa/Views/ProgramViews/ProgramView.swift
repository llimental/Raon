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

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                TabView {
                    ForEach(networkManager.contents, id: \.title) { content in
                        ProgramCardView(
                            programTitle: content.title,
                            programImageURL: content.imageURL
                        )
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
                .tint(Color(themeColor.rawValue))
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
                        .onDisappear(perform: {
                            networkManager.requestProgramContents()
                        })
                }
            }
        }
    }
}

#Preview {
    ProgramView(themeColor: .constant(.pink))
}
