//
//  InternalToastPresenter.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 28/1/26.
//

import SwiftUI

struct ToastPresenterHost<Content: View>: View {

    @StateObject private var manager = ToastManager()
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environment(\.toast, ToastAction { message, type in
                manager.show(message: message, type: type)
            })
            .overlay(alignment: .top) {
                VStack(spacing: 0) {
                    if let toast = manager.toast {
                        ToastView(
                            message: toast.message,
                            type: toast.type,
                            onDismiss: { manager.dismiss() }
                        )
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                    }
                    Spacer(minLength: 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }
}
