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
    }
}

#Preview {
    ProgramView(themeColor: .constant(.pink))
}
