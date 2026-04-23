//
//  FriensyApp.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/17/26.
//

import SwiftUI

@main
struct FriensyApp: App {
    @StateObject var appState = AppStateManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
