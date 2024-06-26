//
//  CalendarView.swift
//  Raon
//
//  Created by Lust3r on 3/19/24.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    // MARK: - SwiftData Properties
    @Query private var favoritePrograms: [FavoriteProgram]
    @Environment(\.modelContext) private var modelContext

    // MARK: - @State Properties
    @State private var selectedDate = Date()

    // MARK: - @Binding Properties
    @Binding var contents: [ProgramContentModel]
    @Binding var themeColor: ThemeColors

    // MARK: - Private Properties
    private let today = Date()

    // MARK: - Body
    var body: some View {
        VStack {
            DatePicker(
                "DatePicker",
                selection: $selectedDate,
                displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .environment(\.locale, Locale(identifier: String(Locale.preferredLanguages[0])))

            ProgramOfTheDayView(
                selectedDate: $selectedDate,
                contents: $contents,
                themeColor: $themeColor,
                favoritePrograms: favoritePrograms)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    selectedDate = today
                }, label: {
                    Text("오늘")
                })
            }
        }
    }
}

#Preview {
    CalendarView(contents: .constant([
        ProgramContentModel(
            category: "뮤지컬/오페라",
            region: "종로구",
            title: "오페라 갈라",
            place: "세종대극장",
            organization: "세종문화회관",
            target: "7세 이상 관람 가능(2017년생부터 관람 가능)",
            fees: "SUITE석 140,000원 / VIP석 120,000원 / R석 100,000원 / S석 80,000원 / A석 50,000원 / B석 30,000원",
            url: "https://www.sejongpac.or.kr/portal/performance/performance/view.do?menuNo=200004&performIdx=34877",
            imageURL: "https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a6cb4e5a9b5b404e83454b084d88a399&thumb=Y",
            startDate: "2024-03-19",
            endDate: "2024-12-07",
            longitude: "37.5726241",
            latitude: "126.9760053",
            isFree: "유료")
    ]),
                 themeColor: .constant(.pink))
    .modelContainer(for: FavoriteProgram.self)
}
