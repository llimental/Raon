//
//  MapButton.swift
//  Raon
//
//  Created by Lust3r on 3/4/24.
//

import SwiftUI

enum MapType {
    case naver
    case kakao
}

struct MapButton: View {
    // MARK: - Public Properties
    var mapType: MapType
    var latitude: String
    var longitude: String

    // MARK: - Body
    var body: some View {
        switch mapType {
            case .naver:
                Button(action: {
                    LinkToNaverMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Image("Naver_map_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                })

            case .kakao:
                Button(action: {
                    LinkToKakaoMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Image("Kakao_map_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
        }
    }

    // MARK: - Private Functions
    private func LinkToNaverMap(latitude: Double, longitude: Double) {
        // 네이버 지도 앱 연동 URL Scheme: https://guide.ncloud-docs.com/docs/maps-url-scheme

        // 네이버 지도를 실행하고 도착지 좌표(dlat, dlng)까지 대중교통(/route/public) 길찾기
        guard let url = URL(string: "nmap://route/public?dlat=\(latitude)&dlng=\(longitude)&appname=com.lust3r.SeoulCultureMoa") else { return }

        // nmap:// 스킴을 인식하지 못하는 경우 앱스토어 페이지로 연결해 앱 설치를 유도
        guard let appStoreURL = URL(string: "https://itunes.apple.com/app/id311867728?mt=8") else { return }

        // canOpenURL 메서드를 통해 네이버 지도 실행 URL이 true를 반환한다면 URL을 연결하여 앱 실행
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            // 네이버 지도가 설치되어 있지 않다면 appStoreURL을 연결
            UIApplication.shared.open(appStoreURL)
        }
    }

    private func LinkToKakaoMap(latitude: Double, longitude: Double) {
        // Kakao 지도 iOS API 가이드: https://apis.map.kakao.com/ios/guide/#urlscheme_open_mapapp

        // 카카오맵을 실행하고 도착지 좌표(WGS84, ep)까지 대중교통(PUBLICTRANSIT) 길찾기
        guard let url = URL(string: "kakaomap://route?ep=\(latitude),\(longitude)&by=PUBLICTRANSIT") else { return }

        // kakaomap:// 스킴을 인식하지 못하는 경우 앱스토어 페이지로 연결해 앱 설치를 유도
        guard let appStoreURL = URL(string: "https://itunes.apple.com/app/id304608425?mt=8") else { return }

        // canOpenURL 메서드를 통해 카카오맵 실행 URL이 true를 반환한다면 URL을 연결하여 앱 실행
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            // 카카오맵이 설치되어 있지 않다면 appStoreURL을 연결
            UIApplication.shared.open(appStoreURL)
        }
    }
}

#Preview {
    HStack {
        MapButton(
            mapType: .naver,
            latitude: "37.5726241",
            longitude: "126.9760053")

        MapButton(
            mapType: .kakao,
            latitude: "37.5726241",
            longitude: "126.9760053")
    }
}
