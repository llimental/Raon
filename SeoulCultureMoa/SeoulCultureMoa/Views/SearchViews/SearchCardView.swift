//
//  SearchCardView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/6/24.
//

import SwiftUI

struct SearchCardView: View {
    // MARK: - Public Properties
    var content: ProgramContentModel

    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            CachedAsyncImageView(url: content.imageURL)
            .scaledToFit()
            .frame(width: 150, height: 200)
            .clipShape(.rect(cornerRadius: 15))

            VStack(alignment: .leading) {
                Text(content.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: 150, alignment: .leading)

                Spacer()

                DividedTextView(
                    firstText: "카테고리",
                    secondText: content.category)
                DividedTextView(
                    firstText: "지역",
                    secondText: content.region)
                DividedTextView(
                    firstText: "시작일",
                    secondText: content.startDate.replacingOccurrences(of: " 00:00:00.0", with: ""))
                DividedTextView(
                    firstText: "유/무료",
                    secondText: content.isFree)
            }
            .frame(height: 200)
        }
        .padding(.vertical)
    }
}

#Preview {
    SearchCardView(
        content: ProgramContentModel(
            category: "뮤지컬/오페라",
            region: "종로구",
            title: "오페라 갈라",
            place: "세종대극장",
            organization: "세종문화회관",
            target: "7세 이상 관람 가능(2017년생부터 관람 가능)",
            fees: "SUITE석 140,000원 / VIP석 120,000원 / R석 100,000원 / S석 80,000원 / A석 50,000원 / B석 30,000원",
            url: "https://www.sejongpac.or.kr/portal/performance/performance/view.do?menuNo=200004&performIdx=34877",
            imageURL: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thumb=Y",
            startDate: "2024-12-07",
            endDate: "2024-12-07",
            longitude: "37.5726241",
            latitude: "126.9760053",
            isFree: "유료"))
}
