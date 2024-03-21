//
//  NotificationToggleView.swift
//  Raon
//
//  Created by Lust3r on 3/15/24.
//

import SwiftUI
import Combine

struct NotificationToggleView: View {
    // MARK: - @EnvironmentObject Properties
    @EnvironmentObject var notificationManager: NotificationManager

    // MARK: - @State Properties
    @State private var isAlertPresented: Bool = false

    // MARK: - @Binding Properties
    @Binding var isToggleOn: Bool

    // MARK: - Body
    var body: some View {
        Toggle(isOn: $isToggleOn, label: {
            Label("알림", systemImage: "bell")
        })
        .onAppear(perform: {
            DispatchQueue.main.async {
                notificationManager.setNotificationStatus()
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            DispatchQueue.main.async {
                notificationManager.setNotificationStatus()
            }
        }
        .onTapGesture {
            isAlertPresented.toggle()
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("알림 설정 변경 안내"),
                message: Text("알림 설정 변경은 설정 앱에서 할 수 있어요."),
                primaryButton: .default(Text("설정"), action: {
                    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }

                    UIApplication.shared.open(settingsURL)
                }),
                secondaryButton: .cancel(Text("닫기"), action: {
                    DispatchQueue.main.async {
                        notificationManager.setNotificationStatus()
                    }
                }))
        }
    }
}


#Preview {
    NotificationToggleView(isToggleOn: .constant(false))
        .environmentObject(NotificationManager())
}
