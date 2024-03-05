//
//  LinkToPlaceView.swift
//  SeoulCultureMoa
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
                let webView = WebView(urlToConnect: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=\(place)")

                webView
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            Button(action: {
                                webView.goBack()
                            }, label: {
                                Image(systemName: "arrowshape.backward")
                            })

                            Button(action: {
                                webView.goForward()
                            }, label: {
                                Image(systemName: "arrowshape.forward")
                            })
                            
                            Button(action: {
                                webView.reload()
                            }, label: {
                                Image(systemName: "arrow.clockwise")
                            })
                        }
                    }
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
