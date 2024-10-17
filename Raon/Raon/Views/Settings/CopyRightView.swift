//
//  CopyRightView.swift
//  Raon
//
//  Created by Lust3r on 3/8/24.
//

import SwiftUI

struct CopyRightView: View {
    // MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("서울특별시 열린데이터 광장")
                    .bold()
                    .font(.title2)

                Image("CC_BY")

                Text("""
                         **ⓒ 2012-2024. Seoul Metropolitan Government Some Rights Reserved.**

                         **저작권자:** 서울특별시
                         **제공기관:** 서울특별시
                         **제공부서:** 문화본부 문화정책과

                         본 앱은 서울특별시 열린데이터 광장의 공공 API를 활용하여 제작되었습니다.
                         자세한 이용약관은 아래 바로가기 버튼을 통해 확인 가능합니다.
                         """)
                .font(.subheadline)

                NavigationLink {
                    CustomWebView(url: "https://data.seoul.go.kr/etc/accessTerms.do#agreement-idx-11")
                } label: {
                    Text("이용약관 바로가기")
                        .foregroundStyle(.blue)
                        .font(.subheadline)
                }

                Spacer()
            }

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CopyRightView()
}
