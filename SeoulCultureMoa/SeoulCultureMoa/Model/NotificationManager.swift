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

    // MARK: - Public Functions
    func addNotificationRequest() {
        center.getNotificationSettings { [weak self] settings in
            if settings.authorizationStatus != .authorized {
                self?.center.requestAuthorization(options: [.alert, .sound]) { _, error in
                    if let error = error {
                        print("requestAuthorization Failed(\(error.localizedDescription))")
                    }
                }
            }
        }
    }
}
