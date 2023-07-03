//
//  ClockTickEmitter.swift.swift
//  NextToGo
//
//  Created by Rhys Geary on 3/7/2023.
//

import Foundation

class ClockTickEmitter: ObservableObject {
    @Published var currentTime = Date()

    init() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                self.currentTime = Date()
            }
        }
    }
}
