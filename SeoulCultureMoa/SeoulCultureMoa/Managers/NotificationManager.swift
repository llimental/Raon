//
//  NotificationManager.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/13/24.
//

import SwiftUI
import UserNotifications

final class NotificationManager: ObservableObject {
    // MARK: - @Published Properties
    @Published var notificationStatus: Bool = false

    // MARK: - Private Properties
    private let center = UNUserNotificationCenter.current()
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter
    }

    // MARK: - Public Functions
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

        center.getPendingNotificationRequests { [weak self] requests in
            if !requests.contains(where: { $0.identifier == title }) {
                let notificationContent = UNMutableNotificationContent()
                notificationContent.body = "즐겨찾기 하신 \(title)이 내일부터 시작해요"

                guard let date = self?.dateFormatter.date(from: dateString)?.getKSTDate() else { return }

                guard let todayString = self?.dateFormatter.string(from: Date()), let today = self?.dateFormatter.date(from: todayString)?.getKSTDate() else { return }

                guard let adjustDate = Calendar.current.date(byAdding: .day, value: -1, to: date), adjustDate > today else { return }

                var dateComponent = Calendar.current.dateComponents([.year, .month, .day], from: adjustDate)
                dateComponent.hour = 9
                dateComponent.minute = 0

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

                let request = UNNotificationRequest(identifier: title, content: notificationContent, trigger: trigger)

                self?.center.add(request) { error in
                    if let error = error {
                        print("Notification add Failed(\(error.localizedDescription))")
                    }
                }
            }
        }
    }

    func removeNotificationRequest(with title: String) {
        center.removePendingNotificationRequests(withIdentifiers: [title])
    }

    func setNotificationStatus() {
        center.getNotificationSettings { [weak self] settings in
            DispatchQueue.main.async {
                self?.notificationStatus = settings.authorizationStatus == .authorized
            }
        }
    }
}
