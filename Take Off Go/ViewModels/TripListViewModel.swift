//
//  TripListViewModel.swift
//  Take Off Go
//
//  Created by Brendan on 12/2/2022.
//

import Foundation

final class TripListViewModel: ObservableObject {
    init() {
        fetchTrips()
    }

    init(trips: [TripViewModel]) {
        self.trips = trips
    }

    @Published var trips = [TripViewModel]()

    private func fetchTrips() {
        let tripKeys = UserDefaults.standard.stringArray(forKey: "trips") ?? []
        trips = tripKeys.enumerated().map { _, k in
            TripViewModel(id: k)
        }
    }

    func addTrip(key: String) {
        let keyNormalised = key.uppercased()

        var tripKeys = UserDefaults.standard.stringArray(forKey: "trips") ?? []

        if !tripKeys.contains(keyNormalised) {
            tripKeys.append(keyNormalised)
        }

        UserDefaults.standard.set(tripKeys, forKey: "trips")

        fetchTrips()
    }

    func removeAt(indicies: IndexSet) {
        var tripKeys = UserDefaults.standard.stringArray(forKey: "trips") ?? []

        tripKeys.remove(atOffsets: indicies)

        UserDefaults.standard.set(tripKeys, forKey: "trips")

        fetchTrips()
    }

    func refresh() {
        for trip in trips {
            trip.reload()
        }
    }
}
