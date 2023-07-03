//
//  RaceCountdownTimer.swift
//  NextToGo
//
//  Created by Rhys Geary on 3/7/2023.
//

import SwiftUI

struct RaceCountdownTimer: View {
    @EnvironmentObject var countdownTimer: ClockTickEmitter
    var raceJumpTime: Date
    
    var jumped: Bool {
        raceJumpTime < Date()
    }
    
    var timeToJump: String {
        let timeDifference = raceJumpTime.timeIntervalSince(countdownTimer.currentTime)
        let remainingSeconds = Int(timeDifference)
        
        let minutes = remainingSeconds / 60
        let seconds = abs(remainingSeconds % 60)
        
        let timePrefix = timeDifference < 0 ? "-" : ""

        if abs(minutes) >= 1 {
            return String(format: "\(timePrefix)%dm %ds", minutes, seconds)
        } else {
            return String(format: "\(timePrefix)%ds", seconds)
        }
    }
    
    var body: some View {
        Text(timeToJump)
            .foregroundColor(jumped ? .red : .green)
    }
}

struct CountdownTimer_Previews: PreviewProvider {
    @StateObject var globalCountdownTimer = ClockTickEmitter()
    
    static var previews: some View {
        Text("Previews are hard")
//        RaceCountdownTimer(raceJumpTime: Date(timeIntervalSince1970: 1287365536))
//            .environmentObject(globalCountdownTimer)
    }
}
