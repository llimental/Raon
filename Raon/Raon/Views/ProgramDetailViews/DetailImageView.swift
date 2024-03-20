//
//  DetailImageView.swift
//  Raon
//
//  Created by Lust3r on 3/21/24.
//

import SwiftUI

struct DetailImageView: View {
    // MARK: - @Binding Properties
    @Binding var isDetailImageShow: Bool

    // MARK: - Public Properties
    let url: String

    // MARK: - Body
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            Button(action: {
                isDetailImageShow.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(.white)
            })
            .padding(.horizontal)

            CachedAsyncImageView(url: url)
                .scaledToFit()
        }
    }
}


#Preview {
    DetailImageView(
        isDetailImageShow: .constant(true),
        url: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thumb=Y")
}
