//
//  NextToGoListViewModel.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

import SwiftUI

struct APIResponse: Codable {
    let status: Int
    let data: NextToGoData
}

class NextToGoListViewModel: ObservableObject {
    @Published var nextToGoResponse: APIResponse? = nil
    @Published var activeFilters: [Constants.CategoryID] = []

    func toggleFilter(_ filterId: Constants.CategoryID) {
       if let index = activeFilters.firstIndex(of: filterId) {
           activeFilters.remove(at: index)
       } else {
           activeFilters.append(filterId)
       }
   }

    var nextToGoRaces: [RaceSummary] {
        var raceSummaries = [RaceSummary]()

        let races = nextToGoResponse?.data.raceSummaries ?? [:]

        for (_, value) in races {
            raceSummaries.append(value)
        }

        return raceSummaries
    }

    var filteredRaces: [RaceSummary] {
        var filtered: [RaceSummary] = []

        if activeFilters.count >= 1 {
            filtered = nextToGoRaces.filter { race in
                activeFilters.contains(race.categoryId)
            }
        } else {
            filtered = nextToGoRaces
        }

        return filtered
    }

    @Sendable func fetchRaces() async {
        guard let endpoint = Bundle.main.object(forInfoDictionaryKey: "NextToGoEndpoint") as? String else {
            fatalError("Unable to retrieve next to go list endpoint.")
        }

        guard let url = URL(string: endpoint) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.nextToGoResponse = decodedResponse
            }
            
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}
