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

    @Published var past = [TripViewModel]()
    @Published var present = [TripViewModel]()
    @Published var future = [TripViewModel]()

    private func fetchTrips() {
        let tripKeys = UserDefaults.standard.stringArray(forKey: "trips") ?? []
        trips = tripKeys.enumerated().map { _, k in
            TripViewModel(id: k)
        }

        past = trips.filter {
            $0.quote != nil &&
                $0.quote!.endDate != nil &&
                $0.quote!.endDate! < Date.now
        }

        present = trips.filter {
            $0.quote != nil &&
                $0.quote!.startDate != nil &&
                $0.quote!.endDate != nil &&
                $0.quote!.startDate! < Date.now &&
                $0.quote!.endDate! > Date.now
        }

        future = trips.filter {
            $0.quote != nil &&
                $0.quote!.startDate != nil &&
                $0.quote!.startDate! > Date.now
        }
    }

    @discardableResult
    func addTrip(key: String) -> TripViewModel {
        let keyNormalised = key.uppercased()

        var tripKeys = UserDefaults.standard.stringArray(forKey: "trips") ?? []

        if !tripKeys.contains(keyNormalised) {
            tripKeys.append(keyNormalised)
        }

        UserDefaults.standard.set(tripKeys, forKey: "trips")

        fetchTrips()

        return trips.first(where: { $0.id == key })!
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
