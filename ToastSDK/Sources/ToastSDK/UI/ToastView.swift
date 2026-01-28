//
//  ToastView.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 27/1/26.
//
import SwiftUI

struct ToastView: View {

    let message: String
    let type: ToastType
    let onDismiss: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: type.imageName)
                .foregroundColor(.white)

            Text(message)
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: 320)
        .background(type.backgroundColor)
        .clipShape(Capsule())
        .shadow(radius: 6)
        .onTapGesture {
            onDismiss()
        }
        .transition(.move(edge: .top).combined(with: .opacity))
    }
}
