//
//  NextToGoRowView.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

import SwiftUI

struct NextToGoRowView: View {
    let race: RaceSummary
    
    var iconName: String {
        Constants.CategoryID(rawValue: race.categoryId.rawValue)?.icon ?? "icon-horse"
    }
    
    var body: some View {
        HStack {
            CategoryIcon(categoryId: race.categoryId.rawValue)
            
            VStack(alignment: .leading) {
                Text("\(race.meetingName) R\(race.raceNumber)")
                    .foregroundColor(.primary)
                Text("\(race.venueName) - \(race.raceForm.distance)m")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            RaceCountdownTimer(raceJumpTime: Date(timeIntervalSince1970: race.advertisedStart.seconds))
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .animation(.easeIn) // deprecated but is what it is
    }
}

struct NextToGoRowView_Previews: PreviewProvider {
    static let meetingName = "Grafton"
    
    static var previews: some View {
        Text("I don't know how to do previews")
    }
}

