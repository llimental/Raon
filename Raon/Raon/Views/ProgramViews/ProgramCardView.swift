//
//  ProgramCardView.swift
//  Raon
//
//  Created by Lust3r on 1/28/24.
//

import SwiftUI

struct ProgramCardView: View {
    // MARK: - Public Properties
    let programImageURL: String

    // MARK: - Body
    var body: some View {
        CachedAsyncImageView(url: programImageURL)
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
        programImageURL: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thumb=Y"
    )
}
