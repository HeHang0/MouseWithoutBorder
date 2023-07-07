//
//  AppDelegate.swift
//  MouseWithoutBorder
//
//  Created by 何航 on 2023/7/6.
//

import AppKit
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    @StateObject private var appState = AppState()
    var statusBarItem: NSStatusItem?
    private var needExit = false
    var window: NSWindow?
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        NSApplication.shared.hide(nil)
        return false
    }
    
    @IBAction func quit(_ sender: Any) {
        NSApplication.shared.hide(nil)
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        NSApplication.shared.hide(nil)
        return false
    }
    
    @IBAction func show(_ sender: Any) {
        window?.makeKeyAndOrderFront(nil)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        
        if let button = statusBarItem?.button {
            button.image = NSImage(named: NSImage.Name("StatusBarIcon")) // 替换为你的状态栏图标的名称
            button.action = #selector(statusBarButtonClicked(_:))
        }
        
        let menu = NSMenu()
        menu.addItem(withTitle: "显示", action: #selector(show(_:)), keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quit", action: #selector(quitMenuItemClicked(_:)), keyEquivalent: "")
        
        statusBarItem?.menu = menu
        
        self.window = NSApplication.shared.windows.first
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
            // 在这里自定义处理退出事件
            
            // 返回 .terminateCancel 以取消默认退出行为
        if(needExit) {
            return .terminateNow
        }
        NSApplication.shared.hide(nil)
        return .terminateCancel
    }
    
    @objc func statusBarButtonClicked(_ sender: NSStatusBarButton) {
        // 处理状态栏图标点击事件的逻辑
    }
    
    @objc func menuItemClicked(_ sender: NSMenuItem) {
        // 处理菜单项点击事件的逻辑
    }
    
    @objc func quitMenuItemClicked(_ sender: NSMenuItem) {
        needExit = true
        NSApplication.shared.terminate(self)
    }
}
