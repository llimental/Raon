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
    case apple
}

struct MapButton: View {
    // MARK: - Public Properties
    var mapType: MapType
    var latitude: String
    var longitude: String
    var place: String

    // MARK: - Body
    var body: some View {
        switch mapType {
            case .naver:
                Button(action: {
                    LinkToNaverMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0,
                        place: place)
                }, label: {
                    Text("네이버 지도")
                })

            case .kakao:
                Button(action: {
                    LinkToKakaoMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Text("카카오맵")
                })

            case .apple:
                Button(action: {
                    LinkToAppleMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0,
                        place: place)
                }, label: {
                    Text("애플 지도")
                })
        }
    }

    // MARK: - Private Functions
    private func LinkToNaverMap(latitude: Double, longitude: Double, place: String) {
        // 네이버 지도 앱 연동 URL Scheme: https://guide.ncloud-docs.com/docs/maps-url-scheme

        // 네이버 지도를 실행하고 전달된 위/경도 장소에 장소명으로 마커 표시
        guard let url = URL(string: "nmap://place?lat=\(latitude)&lng=\(longitude)&name=\(place)&appname=com.lust3r.raon") else { return }

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

        // 카카오맵을 실행하고 전달된 위/경도 장소에 마커 표시
        guard let url = URL(string: "kakaomap://look?p=\(latitude),\(longitude)") else { return }

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

    private func LinkToAppleMap(latitude: Double, longitude: Double, place: String) {
        // Apple URL Scheme Reference: https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html

        // 애플 지도를 실행하고 전달된 위/경도 장소에 장소명으로 마커 표시
        guard let url = URL(string: "http://maps.apple.com/?q=\(place)&ll=\(latitude),\(longitude)") else { return }

        // canOpenURL 메서드를 통해 애플 지도 실행 URL이 true를 반환한다면 URL을 연결하여 앱 실행
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    HStack {
        MapButton(
            mapType: .naver,
            latitude: "37.5726241",
            longitude: "126.9760053",
            place: "세종대극장")

        MapButton(
            mapType: .kakao,
            latitude: "37.5726241",
            longitude: "126.9760053",
            place: "세종대극장")
    }
}
