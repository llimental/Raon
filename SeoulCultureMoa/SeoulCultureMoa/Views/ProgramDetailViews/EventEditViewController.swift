//
//  EventEditViewController.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/19/24.
//

import SwiftUI
import EventKit
import EventKitUI

struct EventEditViewController: UIViewControllerRepresentable {
    // MARK: - @Environment Properties
    @Environment(\.dismiss) var dismiss

    // MARK: - @Binding Properties
    @Binding var event: EKEvent?

    // MARK: - Public Properties
    let eventStore: EKEventStore

    // MARK: - UIViewControllerRepresentable
    typealias UIViewControllerType = EKEventEditViewController

    func makeUIViewController(context: Context) -> EKEventEditViewController {
        let controller = EKEventEditViewController()
        controller.eventStore = eventStore
        controller.event = event
        controller.editViewDelegate = context.coordinator

        return controller
    }
    
    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) { }

    // MARK: - Coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, EKEventEditViewDelegate {
        var parent: EventEditViewController

        init(_ controller: EventEditViewController) {
            self.parent = controller
        }

        func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            parent.dismiss()
        }
    }
}
