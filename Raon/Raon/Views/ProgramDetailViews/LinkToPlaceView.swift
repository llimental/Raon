//
//  LinkToPlaceView.swift
//  Raon
//
//  Created by Lust3r on 3/4/24.
//

import SwiftUI

struct LinkToPlaceView: View {
    // MARK: - Public Properties
    var latitude: String
    var longitude: String
    var place: String

    // MARK: - Body
    var body: some View {
        HStack(spacing: 20) {
            MapButton(
                mapType: .naver,
                latitude: latitude,
                longitude: longitude)
            .padding(.leading, 78)

            MapButton(
                mapType: .kakao,
                latitude: latitude,
                longitude: longitude)

            NavigationLink {
                CustomWebView(url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=\(place)")
            } label: {
                Image("Safari_Icon")
                    .resizable()
                    .frame(width: 35, height: 35)
            }

            Spacer()
        }
    }
}

#Preview {
    LinkToPlaceView(
        latitude: "126.9760053",
        longitude: "37.5726241",
        place: "세종대극장")
}
