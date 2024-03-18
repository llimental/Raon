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
        DatePicker(
            "DatePicker",
            selection: $selectionDate,
            displayedComponents: [.date])
        .datePickerStyle(.graphical)
    }
}

#Preview {
    CalendarView()
}
