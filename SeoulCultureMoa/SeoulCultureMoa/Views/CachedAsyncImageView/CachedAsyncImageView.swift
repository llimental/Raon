//
//  CachedAsyncImageView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/6/24.
//

import SwiftUI

struct CachedAsyncImageView: View {
    // MARK: - @State Properties
    @State private var image: UIImage?

    // MARK: - Public Properties
    let url: String

    // MARK: - Body
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
                .onAppear {
                    CacheManager.shared.fetchImage(urlString: url) { image in
                        self.image = image
                    }
                }
        }
    }
}


#Preview {
    CachedAsyncImageView(url: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thub=Y")
}
