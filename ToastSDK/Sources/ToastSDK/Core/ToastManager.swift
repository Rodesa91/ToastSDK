//
//  ToastManager.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 27/1/26.
//
import SwiftUI

@MainActor
final class ToastManager: ObservableObject {

    @Published private(set) var toast: ToastData?

    private var dismissTask: Task<Void, Never>?

    func show(message: String, type: ToastType) {
        dismissTask?.cancel()

        let messageToShow = message
        let typeToShow = type
        let wasShowingToast = toast != nil

        if wasShowingToast {
            withAnimation(.easeInOut(duration: 0.3)) {
                toast = nil
            }
            dismissTask = Task { @MainActor [weak self] in
                guard let self else { return }
                try? await Task.sleep(nanoseconds: 300_000_000)
                guard !Task.isCancelled else { return }
                withAnimation(.easeInOut(duration: 0.3)) {
                    toast = ToastData(message: messageToShow, type: typeToShow)
                }
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                guard !Task.isCancelled else { return }
                self.dismiss()
            }
        } else {
            withAnimation(.easeInOut(duration: 0.3)) {
                toast = ToastData(message: messageToShow, type: typeToShow)
            }
            dismissTask = Task { @MainActor [weak self] in
                guard let self else { return }
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                guard !Task.isCancelled else { return }
                self.dismiss()
            }
        }
    }

    func dismiss() {
        withAnimation(.easeInOut(duration: 0.3)) {
            toast = nil
        }
    }
}
