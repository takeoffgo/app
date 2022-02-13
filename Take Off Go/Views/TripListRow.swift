//
//  TripListRow.swift
//  Take Off Go
//
//  Created by Brendan on 12/2/2022.
//

import SwiftUI

struct TripListRow: View {
    @ObservedObject var trip: TripViewModel

    var body: some View {
        if trip.loading {
            HStack {
                Text(trip.id)
                Spacer()
                ProgressView()
            }
        } else if trip.error {
            HStack {
                Text(trip.id)
                Spacer()
                Label("Error", systemImage: "exclamationmark")
            }
        } else {
            NavigationLink(destination: TripDetail(quote: trip.quote!)
                .navigationTitle(trip.quote?.hero?.title ?? trip.id)) {
                    VStack {
                        Text(trip.quote?.hero?.title ?? trip.id)
                    }
                }
        }
    }
}

struct TripListRow_Previews: PreviewProvider {
    static var previews: some View {
        TripListRow(trip: TripViewModel(id: "ABC123", quote: nil))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
