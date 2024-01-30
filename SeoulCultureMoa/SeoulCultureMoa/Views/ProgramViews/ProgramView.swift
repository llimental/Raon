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
        GeometryReader { geometry in
            NavigationStack {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 20) {
                        ForEach(networkManager.contents.sorted { $0.startDate < $1.startDate }, id: \.title) { content in
                            ProgramCardView(
                                themeColor: $themeColor,
                                programTitle: content.title,
                                programImageURL: content.imageURL
                            )
                            .frame(width: geometry.size.width * 0.7)
                            .padding()
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .frame(height: geometry.size.height * 0.8)
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
                .tint(Color(themeColor.rawValue))
                .padding()
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height)
        }
    }
}

#Preview {
    ProgramView(themeColor: .constant(.pink))
}
