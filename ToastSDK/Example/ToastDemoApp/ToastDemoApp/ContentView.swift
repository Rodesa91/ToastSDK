//
//  ContentView.swift
//  ToastDemoApp
//
//  Created by Rodrigo de Santiago on 28/1/26.
//

import SwiftUI
import ToastSDK

struct ContentView: View {

    @Environment(\.toast) private var toast

    var body: some View {
        VStack(spacing: 20) {
            Button("Show Success") {
                toast.show("Success!", .success)
            }

            Button("Show Error") {
                toast.show("Error!", .error)
            }

            Button("Show Warning") {
                toast.show("Warning!", .warning)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
