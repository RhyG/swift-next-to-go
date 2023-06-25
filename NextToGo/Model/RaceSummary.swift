//
//  RaceSummary.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

import Foundation

struct NextToGoData: Codable {
    let nextToGoIds: [String]
    let raceSummaries: [String: RaceSummary]

    enum CodingKeys: String, CodingKey {
        case nextToGoIds = "next_to_go_ids"
        case raceSummaries = "race_summaries"
    }
}

struct RaceSummary: Codable {
    let raceId: String
    let raceName: String
    let raceNumber: Int
    let meetingId: String
    let meetingName: String
    let categoryId: Constants.CategoryID
    let advertisedStart: AdvertisedStart
    let raceForm: RaceForm
    let venueId: String
    let venueName: String
    let venueState: String
    let venueCountry: String

    enum CodingKeys: String, CodingKey {
        case raceId = "race_id"
        case raceName = "race_name"
        case raceNumber = "race_number"
        case meetingId = "meeting_id"
        case meetingName = "meeting_name"
        case categoryId = "category_id"
        case advertisedStart = "advertised_start"
        case raceForm = "race_form"
        case venueId = "venue_id"
        case venueName = "venue_name"
        case venueState = "venue_state"
        case venueCountry = "venue_country"
    }
}

struct AdvertisedStart: Codable {
    let seconds: Int
}

struct RaceForm: Codable {
    let distance: Int
    let distanceTypeId: String

    enum CodingKeys: String, CodingKey {
        case distance
        case distanceTypeId = "distance_type_id"
    }
}

