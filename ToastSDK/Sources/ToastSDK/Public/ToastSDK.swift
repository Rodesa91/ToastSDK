//
//  ToastPresenter.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 27/1/26.
//
import SwiftUI

public struct ToastAction: Sendable {
    public var show: @MainActor @Sendable (_ message: String, _ type: ToastType) -> Void

    public init(show: @escaping @MainActor @Sendable (_ message: String, _ type: ToastType) -> Void) {
        self.show = show
    }

    public static let noop = ToastAction { _, _ in }
}

private struct ToastEnvironmentKey: EnvironmentKey {
    static let defaultValue: ToastAction = .noop
}

public extension EnvironmentValues {
    var toast: ToastAction {
        get { self[ToastEnvironmentKey.self] }
        set { self[ToastEnvironmentKey.self] = newValue }
    }
}
