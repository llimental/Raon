//
//  NavigationBarSmallTitleView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/9/24.
//

import SwiftUI

struct NavigationBarSmallTitleView: View {
    // MARK: - Public Properties
    var titleText: String
    var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        Text(titleText)
            .font(.title2)
            .bold()
            .foregroundStyle(themeColor.color)
    }
}

#Preview {
    NavigationBarSmallTitleView(
        titleText: "SmallTitle",
        themeColor: .pink)
}
