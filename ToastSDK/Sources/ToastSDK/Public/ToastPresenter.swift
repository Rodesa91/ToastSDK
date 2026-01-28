//
//  ToastPresenter.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 27/1/26.
//
import SwiftUI

public struct ToastPresenter: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .modifier(InternalToastPresenter())
    }
}

public extension View {
    func toastPresenter() -> some View {
        modifier(ToastPresenter())
    }
}
