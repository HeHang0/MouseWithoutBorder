//
//  MouseWithoutBorderApp.swift
//  MouseWithoutBorder
//
//  Created by 何航 on 2023/7/6.
//

import SwiftUI

@main
struct MouseWithoutBorderApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
