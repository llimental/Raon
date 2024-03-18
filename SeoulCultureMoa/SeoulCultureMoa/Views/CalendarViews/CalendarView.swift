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

            ProgramOfTheDayView(
                selectedDate: $selectedDate,
                contents: $contents)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CalendarView(contents: .constant(NetworkManager().contents))
}
