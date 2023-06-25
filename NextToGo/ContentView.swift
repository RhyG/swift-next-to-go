//
//  ContentView.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nextToGoListVM = NextToGoListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    ForEach(Constants.CategoryID.allCases, id: \.self) { categoryId in
                        Checkbox(
                            isChecked: nextToGoListVM.activeFilters.contains(categoryId),
                            categoryId: categoryId,
                            action: { nextToGoListVM.toggleFilter(categoryId) }
                        )
                    }
                }
                .padding(.bottom, 20)
                
                ScrollView {
                    ForEach(nextToGoListVM.filteredRaces, id: \.raceId) { race in
                        NavigationLink {
                            Text("RaceScreen")
                        } label: {
                            NextToGoRowView(race: race)
                        }
                    }
                }
                .refreshable(action: nextToGoListVM.fetchRaces)
                .task {
                    await nextToGoListVM.fetchRaces()
                }
                
            }
            .padding()
            .navigationTitle("Next To Go")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
