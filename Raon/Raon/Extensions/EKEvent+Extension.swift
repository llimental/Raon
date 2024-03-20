//
//  EKEvent+Extension.swift
//  Raon
//
//  Created by Lust3r on 3/20/24.
//

import EventKit

extension EKEvent {
    convenience init(eventStore store: EKEventStore, content: ProgramContentModel) {
        self.init(eventStore: store)
        self.title = content.title
        self.startDate = content.startDate.getDateOfString()
        self.endDate = content.endDate.getDateOfString()
        self.isAllDay = true

        let structuredLocation = EKStructuredLocation()
        structuredLocation.title = content.place
        structuredLocation.geoLocation = CLLocation(
            latitude: Double(content.latitude) ?? 0,
            longitude: Double(content.longitude) ?? 0)

        self.structuredLocation = structuredLocation
    }
}
