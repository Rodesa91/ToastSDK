//
//  ToastDemoAppApp.swift
//  ToastDemoApp
//
//  Created by Rodrigo de Santiago on 28/1/26.
//

import SwiftUI
import ToastSDK

@main
struct ToastDemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .toastPresenter()
        }
    }
}
