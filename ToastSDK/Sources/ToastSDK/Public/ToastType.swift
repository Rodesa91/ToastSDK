//
//  ToastType.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 27/1/26.
//
import SwiftUI

public enum ToastType {
    
    case success, error, warning
    
    var imageName: String {
        switch self {
        case .success:
            return "checkmark.circle.fill"
        case .error:
            return "xmark.octagon.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .success:
            return Color.green
        case .error:
            return Color.red
        case .warning:
            return Color.yellow
        }
    }
}
