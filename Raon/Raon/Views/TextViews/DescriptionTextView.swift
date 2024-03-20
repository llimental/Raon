//
//  DescriptionTextView.swift
//  Raon
//
//  Created by Lust3r on 2/26/24.
//

import SwiftUI

struct DescriptionTextView: View {
    // MARK: - Public Properties
    var firstText: String
    var secondText: String
    var textColor: ThemeColors

    // MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            Text(firstText + ":")
                .bold()
                .foregroundStyle(textColor.color)
                .frame(width: 70, alignment: .trailing)

            Text(secondText)

            Spacer()
        }
        .font(.subheadline)
    }
}

#Preview {
    DescriptionTextView(
        firstText: "카테고리",
        secondText: "카테고리 내용",
        textColor: .pink)
}
