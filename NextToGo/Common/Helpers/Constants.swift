//
//  Constants.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

struct Constants {
    static let RACE_URL = "https://api.neds.com.au/rest/v1/racing/?method=nextraces&count=10"
    
    enum CategoryID: String, CaseIterable, Codable {
        case greyhound = "9daef0d7-bf3c-4f50-921d-8e818c60fe61"
        case harness = "161d9be2-e909-4326-8c2c-35ed71fb460b"
        case horse = "4a2788f8-e825-4d36-9894-efd4baf1cfae"
        
        var icon: String {
            switch self {
            case .greyhound:
                return "icon-greyhound"
            case .harness:
                return "icon-harness"
            case .horse:
                return "icon-horse"
            }
        }
    }
}
