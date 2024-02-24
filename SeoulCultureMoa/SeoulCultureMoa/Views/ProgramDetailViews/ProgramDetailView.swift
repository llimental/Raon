//
//  ProgramDetailView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/22/24.
//

import SwiftUI

struct ProgramDetailView: View {
    // MARK: - Public Properties
    var content: ProgramContent

    var body: some View {
        AsyncImage(url: URL(string: content.imageURL)) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                Color.gray
            }
        }
        .scaledToFit()
        .opacity(0.5)
    }
}

#Preview {
    ProgramDetailView(
        content: ProgramContent(
            category: "뮤지컬/오페라",
            region: "종로구",
            title: "오페라 갈라",
            place: "세종대극장",
            organization: "세종문화회관",
            target: "7세 이상 관람 가능(2017년생부터 관람 가능)",
            fees: "SUITE석 140,000원 / VIP석 120,000원 / R석 100,000원 / S석 80,000원 / A석 50,000원 / B석 30,000원",
            player: "",
            url: "https://www.sejongpac.or.kr/portal/performance/performance/view.do?menuNo=200004&performIdx=34877",
            imageURL: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thumb=Y",
            startDate: "2024-12-07",
            endDate: "2024-12-07",
            longitude: "37.5726241",
            latitude: "126.9760053",
            isFree: "유료"))
}
