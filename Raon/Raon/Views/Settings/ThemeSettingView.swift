//
//  ThemeSettingView.swift
//  Raon
//
//  Created by Lust3r on 3/16/24.
//

import SwiftUI

struct ThemeSettingView: View {
    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        DisclosureGroup(
            content: {
                ForEach(ThemeColors.allCases, id: \.self) { color in
                    Button(action: {
                        themeColor = color
                    }, label: {
                        Label(color.rawValue, systemImage: "circle.fill")
                            .foregroundStyle(color.color)
                    })
                }
            },
            label: {
                HStack {
                    Label("앱 색상", systemImage: "paintbrush")

                    Spacer()

                    Text(themeColor.rawValue)
                        .foregroundStyle(themeColor.color)
                }
            }
        )
    }
}

#Preview {
    ThemeSettingView(themeColor: .constant(.pink))
}
