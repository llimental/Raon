//
//  SearchCardView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/6/24.
//

import SwiftUI

struct SearchCardView: View {
    // MARK: - Public Properties
    let title: String
    let imageURL: String
    let category: String
    let region: String
    let startDate: String
    let isFree: String

    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string: imageURL)) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Color.gray
                } else {
                    ProgressView()
                }
            }
            .frame(width: 150, height: 200)
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 15))

            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                    .frame(width: 200, alignment: .leading)

                Spacer()

                DividedTextView(
                    firstText: "카테고리",
                    secondText: category)
                DividedTextView(
                    firstText: "지역",
                    secondText: region)
                DividedTextView(
                    firstText: "시작일",
                    secondText: startDate.replacingOccurrences(of: " 00:00:00.0", with: ""))
                DividedTextView(
                    firstText: "유/무료",
                    secondText: isFree)
            }
        }
        .frame(width: 400, height: 200)
        .padding()
    }
}

#Preview {
    SearchCardView(
        title: "윤수빈 플루트 독주회",
        imageURL: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a9d45f908f42420ba719f6f811c1b243&thumb=Y",
        category: "교육/문화",
        region: "광진구",
        startDate: "2024-02-10 00:00:00.0",
        isFree: "무료")
}

struct DividedTextView: View {
    // MARK: - Public Properties
    let firstText: String
    let secondText: String

    // MARK: - Body
    var body: some View {
        HStack {
            Text(firstText)
                .foregroundStyle(.gray)
            Text(secondText)
        }
        .font(.footnote)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}
