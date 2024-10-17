//
//  CachedAsyncImageView.swift
//  Raon
//
//  Created by Lust3r on 3/6/24.
//

import SwiftUI
import Combine

struct CachedAsyncImageView: View {
    // MARK: - @State Properties
    @State private var image: UIImage?
    @State private var cancellable: AnyCancellable?

    // MARK: - Public Properties
    let url: String

    // MARK: - Body
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            cancellable = CacheManager.shared.fetchImage(from: url)
                .receive(on: DispatchQueue.main)
                .sink { image in
                    self.image = image
                }
        }
        .onDisappear {
            cancellable?.cancel()
        }
    }
}


#Preview {
    CachedAsyncImageView(url: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thub=Y")
}
