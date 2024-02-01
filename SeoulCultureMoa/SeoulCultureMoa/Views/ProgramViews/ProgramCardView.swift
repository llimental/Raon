//
//  ProgramCardView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import SwiftUI

struct ProgramCardView: View {
    let programTitle: String
    let programImageURL: String

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: programImageURL),
                content: { image in
                    image.resizable()
                },
                placeholder: {
                    ProgressView()
                })
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 15))
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: .primary, radius: 3, x: 7, y: 7)
                .opacity(0.5)
        )
    }
}

#Preview {
    ProgramCardView(
        programTitle: "프로그램 제목",
        programImageURL: ""
    )
}
