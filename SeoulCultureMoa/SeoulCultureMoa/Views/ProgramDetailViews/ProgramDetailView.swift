//
//  ProgramDetailView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/22/24.
//

import SwiftUI
import SwiftData

struct ProgramDetailView: View {
    // MARK: - SwiftData Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var favoritePrograms: [FavoriteProgram]

    // MARK: - @State Properties
    @State private var isFavorite: Bool = false

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Public Properties
    var content: ProgramContentModel

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                CachedAsyncImageView(url: content.imageURL)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .scaledToFit()
                    .blur(radius: 5)

                Color.black
                    .opacity(0.5)

                VStack {
                    HStack(alignment: .bottom) {
                        Text(content.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 2)

                        Spacer()

                        Button(action: {
                            isFavorite.toggle()
                        }, label: {
                            isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                        })
                        .frame(height: 20)

                        ShareLink(item: URL(string: content.url)!) {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .frame(height: 25)
                    }
                    .font(.title2)
                    .foregroundStyle(themeColor.color)
                    .padding(.horizontal, 20)

                    ZStack(alignment: .bottom) {
                        ProgramDescriptionView(themeColor: $themeColor, content: content)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.7)

                        NavigationLink {
                            CustomWebView(url: content.url)
                        } label: {
                            ColoredText(
                                text: "홈페이지 이동",
                                textColor: themeColor,
                                textWidth: geometry.size.width * 0.9)
                        }
                        .padding()
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .toolbarTitleDisplayMode(.inline)
            .onAppear {
                isFavorite = getFavoriteState()
            }

    // MARK: - Private Functions
    private func getFavoriteState() -> Bool {
        return favoritePrograms.contains(where: { $0.title == content.title }) ? true : false
    }
        }
    }
}

#Preview {
    ProgramDetailView(
        themeColor: .constant(.pink),
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
    .modelContainer(for: FavoriteProgram.self)
}
