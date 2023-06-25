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
                Text("\(race.venueName) - \(race.raceForm.distance)m") // todo use dot not -
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("1m 44s")
            Image(systemName: "chevron.right")
        }
    }
}

struct NextToGoRowView_Previews: PreviewProvider {
    static let meetingName = "Grafton"
    
    static var previews: some View {
//        NextToGoRowView(race: json["race_summaries"]["605c6d5b095fe02a3478811f"])
        Text("Wow")
    }
}

