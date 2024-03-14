//
//  NotificationManager.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/13/24.
//

import SwiftUI
import UserNotifications

final class NotificationManager: ObservableObject {
    // MARK: - Private Properties
    private let center = UNUserNotificationCenter.current()
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter
    }

    // MARK: - Private Functions
    func addNotificationRequest(with title: String, when dateString: String) {
        center.getNotificationSettings { [weak self] settings in
            if settings.authorizationStatus != .authorized {
                self?.center.requestAuthorization(options: [.alert, .sound]) { _, error in
                    if let error = error {
                        print("requestAuthorization Failed(\(error.localizedDescription))")
                    }
                }
            }
        }

        let notificationContent = UNMutableNotificationContent()
        notificationContent.body = "\(title)이 일주일 뒤에 열려요"

        guard let date = dateFormatter.date(from: dateString.replacingOccurrences(of: " 00:00:00.0", with: "")) else { return }

        guard let adjustDate = Calendar.current.date(byAdding: .day, value: -7, to: date) else { return }

        var dateComponent = Calendar.current.dateComponents([.year, .month, .day], from: adjustDate)
        dateComponent.hour = 9
        dateComponent.minute = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

        let request = UNNotificationRequest(identifier: title, content: notificationContent, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                print("Notification add Failed(\(error.localizedDescription))")
            }
        }
    }
}
