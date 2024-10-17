//
//  NavigationBarLargeTitleView.swift
//  Raon
//
//  Created by Lust3r on 3/9/24.
//

import SwiftUI

struct NavigationBarLargeTitleView: View {
    // MARK: - Public Properties
    var titleText: String
    var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        Text(titleText)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(themeColor.color)
            .padding(.leading)
    }
}

#Preview {
    NavigationBarLargeTitleView(
        titleText: "LargeTitle",
        themeColor: .pink)
}
