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

    // MARK: - Private Properties
    /// 토글과 바인딩을 커스터마이징하여 값 변경을 막고 알림 표시하는 프로퍼티
    private var bindingForToggle: Binding<Bool> {
        Binding<Bool>(
            get: { notificationManager.notificationStatus },
            set: { _ in
                isAlertPresented = true
            }
        )
    }

    // MARK: - Body
    var body: some View {
        Toggle(isOn: bindingForToggle, label: {
            Label("알림", systemImage: "bell")
        })
        .onAppear(perform: {
            notificationManager.setNotificationStatus()
        })
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            notificationManager.setNotificationStatus()
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("알림 설정 변경 안내"),
                message: Text("알림 설정 변경은 설정 앱에서 할 수 있어요."),
                primaryButton: .default(Text("설정"), action: {
                    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }

                    UIApplication.shared.open(settingsURL)
                }),
                secondaryButton: .cancel(Text("닫기"))
            )
        }
    }
}


#Preview {
    NotificationToggleView()
        .environmentObject(NotificationManager())
}
