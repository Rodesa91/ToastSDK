//
//  ToastData.swift
//  ToastSDK
//
//  Created by Rodrigo de Santiago on 27/1/26.
//
import Foundation

struct ToastData: Identifiable {
    let id = UUID()
    let message: String
    let type: ToastType
}
