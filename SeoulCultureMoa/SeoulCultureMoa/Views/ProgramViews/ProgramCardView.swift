//
//  ProgramCardView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import SwiftUI

struct ProgramCardView: View {
    // MARK: - Public Properties
    let programTitle: String
    let programImageURL: String

    // MARK: - Body
    var body: some View {
        AsyncImage(url: URL(string: programImageURL)) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                Color.gray
            } else {
                ProgressView()
            }
        }
        .scaledToFit()
        .clipShape(.rect(cornerRadius: 15))
        .background(
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: .primary, radius: 5)
                .opacity(0.5)
        )
    }
}

#Preview {
    ProgramCardView(
        programTitle: "오페라 갈라",
        programImageURL: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thumb=Y"
    )
}
