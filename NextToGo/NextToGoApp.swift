//
//  NextToGoApp.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

import SwiftUI

@main
struct NextToGoApp: App {
    @StateObject var globalCountdownTimer = ClockTickEmitter()
    
    var body: some Scene {
        WindowGroup {
            NextToGoView(nextToGoListVM: NextToGoListViewModel())
                .environmentObject(globalCountdownTimer)
        }
    }
}
