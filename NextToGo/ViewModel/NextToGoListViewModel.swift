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
    
    private var poll: Timer?
    private var fetchRacesTask: Task<Void, Error>?
    
    init() {
        fetchRacesTask = Task {
            await self.fetchRaces()
        }
        
        poll = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in
            self?.fetchRacesTask = Task {
                await self?.fetchRaces()
            }
        }
    }
    
    deinit {
        poll?.invalidate()
        fetchRacesTask?.cancel()
    }

    func toggleFilter(_ filterId: Constants.CategoryID) {
       if let index = activeFilters.firstIndex(of: filterId) {
           activeFilters.remove(at: index)
       } else {
           activeFilters.append(filterId)
       }
   }

    var nextToGoRaceData: [RaceSummary] {
        var raceSummaries = [RaceSummary]()

        let races = nextToGoResponse?.data.raceSummaries ?? [:]

        for (_, value) in races {
            raceSummaries.append(value)
        }

        return raceSummaries
    }

    var filteredRaces: [RaceSummary] {
        var filteredRaces: [RaceSummary] = []

        if activeFilters.count >= 1 {
            filteredRaces = nextToGoRaceData.filter { race in
                activeFilters.contains(race.categoryId)
            }
        } else {
            filteredRaces = nextToGoRaceData
        }
        
        let filteredByJumpTime = removeJumped(filteredRaces)
        return sortByStartTime(filteredByJumpTime)
    }
    
    func sortByStartTime(_ races: [RaceSummary]) -> [RaceSummary] {
        return races.sorted {
            $1.advertisedStart.seconds > $0.advertisedStart.seconds
        }
    }
    
    func removeJumped(_ races: [RaceSummary]) -> [RaceSummary] {
        var filteredRaces: [RaceSummary] = [];
        
        races.forEach { race in
            let jumpTime = Date(timeIntervalSince1970: race.advertisedStart.seconds)
            
            if jumpTime < Date(timeIntervalSince1970: race.advertisedStart.seconds + 60) {
                filteredRaces.append(race)
            }
        }
        
        return filteredRaces
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
            
            await MainActor.run {
                self.nextToGoResponse = decodedResponse
            }
            
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}
