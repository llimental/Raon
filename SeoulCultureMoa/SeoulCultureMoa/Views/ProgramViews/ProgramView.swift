//
//  ProgramView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/27/24.
//

import SwiftUI

struct ProgramView: View {
    @Binding var themeColor: ThemeColors

    @StateObject private var networkManager = NetworkManager()

    var body: some View {
        NavigationStack {
            Divider()

            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(networkManager.contents.sorted { $0.startDate < $1.startDate }, id: \.title) { content in
                        ProgramCardView(
                            themeColor: $themeColor,
                            programTitle: content.title,
                            programImageURL: content.imageURL
                        )
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("프로그램")
            .navigationBarTitleTextColor(Color(themeColor.rawValue))
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink {

                    } label: {
                        Image(systemName: "calendar")
                    }

                    NavigationLink {

                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            .padding(.vertical)
        }
        .tint(Color(themeColor.rawValue))
    }
}

#Preview {
    ProgramView(themeColor: .constant(.pink))
}
