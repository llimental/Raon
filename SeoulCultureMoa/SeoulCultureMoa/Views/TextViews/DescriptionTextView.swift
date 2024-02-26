//
//  DescriptionTextView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/26/24.
//

import SwiftUI

struct DescriptionTextView: View {
    // MARK: - Public Properties
    var firstText: String
    var secondText: String
    var tintColor: String

    // MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            Text(firstText + ":")
                .bold()
                .foregroundStyle(Color(tintColor))
                .frame(width: 70, alignment: .trailing)

            Text(secondText)

            Spacer()
        }
        .font(.footnote)
    }
}

#Preview {
    DescriptionTextView(
        firstText: "카테고리",
        secondText: "카테고리 내용",
        tintColor: "AccentColor_Pink")
}
