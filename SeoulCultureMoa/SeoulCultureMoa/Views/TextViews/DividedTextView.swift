//
//  DividedTextView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/7/24.
//

import SwiftUI

struct DividedTextView: View {
    // MARK: - Public Properties
    let firstText: String
    let secondText: String

    // MARK: - Body
    var body: some View {
        HStack {
            Text(firstText)
                .foregroundStyle(.gray)
            Text(secondText)
        }
        .font(.footnote)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    DividedTextView(
        firstText: "분류",
        secondText: "내용")
}
