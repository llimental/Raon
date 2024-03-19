//
//  ProgramDescriptionView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/24/24.
//

import EventKit
import SwiftUI

struct ProgramDescriptionView: View {
    // MARK: - @State Properties
    @State private var selectedEvent: EKEvent?
    @State private var showEventEditViewController = false
    @State private var store = EKEventStore()

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Public Properties
    var content: ProgramContentModel

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                DescriptionTextView(
                    firstText: "카테고리",
                    secondText: content.category,
                    textColor: themeColor)

                DescriptionTextView(
                    firstText: "지역",
                    secondText: content.region,
                    textColor: themeColor)

                VStack {
                    DescriptionTextView(
                        firstText: "장소",
                        secondText: content.place,
                        textColor: themeColor)

                    LinkToPlaceView(
                        latitude: content.latitude,
                        longitude: content.longitude,
                        place: content.place)
                }

                DescriptionTextView(
                    firstText: "기관",
                    secondText: content.organization,
                    textColor: themeColor)

                DescriptionTextView(
                    firstText: "대상",
                    secondText: content.target,
                    textColor: themeColor)

                DescriptionTextView(
                    firstText: "비용",
                    secondText: content.fees != String() ? content.fees : "무료",
                    textColor: themeColor)

                DescriptionTextView(
                    firstText: "시작일",
                    secondText: content.startDate,
                    textColor: themeColor)

                DescriptionTextView(
                    firstText: "종료일",
                    secondText: content.endDate,
                    textColor: themeColor)

                Button(action: {
                    makeNewEvent()
                    showEventEditViewController.toggle()
                }, label: {
                    Label("캘린더에 추가하기", systemImage: "calendar.badge.plus")
                        .font(.subheadline)
                })
                .sheet(isPresented: $showEventEditViewController, content: {
                    EventEditViewController(event: $selectedEvent, eventStore: store)
                })
                .padding(.bottom, 100)
            }
            .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
        }
        .background()
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .shadow(color: .primary, radius: 3)
        .scrollIndicators(.hidden)
    }

    // MARK: - Private Functions
    private func makeNewEvent() {
        self.selectedEvent = EKEvent(eventStore: store, content: content)
    }
}

#Preview {
    ProgramDescriptionView(
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
}
