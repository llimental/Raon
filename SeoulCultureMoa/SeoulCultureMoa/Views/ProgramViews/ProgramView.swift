//
//  ProgramView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/27/24.
//

import SwiftUI

struct ProgramView: View {
    @Binding var themeColor: ThemeColors

    var body: some View {
        NavigationStack {
            Divider()

            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color(themeColor.rawValue).opacity(0.2))
                            .clipShape(.rect(cornerRadius: 15))

                        ProgramCardView(themeColor: $themeColor)
                            .padding()
                    }

                    ProgramCardView(themeColor: $themeColor)

                    ProgramCardView(themeColor: $themeColor)
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
