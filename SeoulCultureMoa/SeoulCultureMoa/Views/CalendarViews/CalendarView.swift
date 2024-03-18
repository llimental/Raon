//
//  CalendarView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/19/24.
//

import SwiftUI

struct CalendarView: View {
    // MARK: - @State Properties
    @State private var selectedDate = Date()

    // MARK: - @Binding Properties
    @Binding var contents: [ProgramContentModel]

    // MARK: - Body
    var body: some View {
        VStack {
            DatePicker(
                "DatePicker",
                selection: $selectedDate,
                displayedComponents: [.date])
            .datePickerStyle(.graphical)

            List {
                let selectedDateString = selectedDate.getStringOfTodayDate()
                let selectedDateContents = contents.filter { $0.startDate == selectedDateString }

                Section {
                    ForEach(selectedDateContents, id: \.title) { content in
                        NavigationLink {

                        } label: {
                            Text(content.title)
                        }
                    }
                } header: {
                    Text("\(selectedDateString) 시작하는 프로그램 수: \(selectedDateContents.count)")
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CalendarView(contents: .constant(NetworkManager().contents))
}
