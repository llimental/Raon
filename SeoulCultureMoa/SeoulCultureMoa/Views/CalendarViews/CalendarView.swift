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

    // MARK: - Body
    var body: some View {
        VStack {
            DatePicker(
                "DatePicker",
                selection: $selectedDate,
                displayedComponents: [.date])
            .datePickerStyle(.graphical)

            List {
                HStack {
                    Text("아이유 콘서트")

                    Spacer()

                    Image(systemName: "heart")
                }

                HStack {
                    Text("임영웅 콘서트")

                    Spacer()

                    Image(systemName: "heart")
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CalendarView()
}
