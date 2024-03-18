//
//  CalendarView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/19/24.
//

import SwiftUI

struct CalendarView: View {
    // MARK: - @State Properties
    @State private var selectionDate = Date()

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            DatePicker(
                "DatePicker",
                selection: $selectionDate,
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
            .listRowSeparator(.hidden)
        }
        .padding()
    }
}

#Preview {
    CalendarView()
}
