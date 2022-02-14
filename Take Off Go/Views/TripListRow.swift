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
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    if trip.quote?.hero?.image?.hash != nil {
                        FullWidthImage(hash: trip.quote!.hero!.image!.hash!)
                    }
                    Text(trip.quote?.hero?.title ?? trip.id)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                NavigationLink(destination: TripDetail(quote: trip.quote!)) { EmptyView() }
                    .opacity(0)
            }.listRowInsets(EdgeInsets())
        }
    }
}

struct TripListRow_Previews: PreviewProvider {
    static var previews: some View {
        TripListRow(trip: TripViewModel(id: "ABC123", quote: nil))
            .previewLayout(.fixed(width: 400, height: 200))

        TripListRow(trip: TripViewModel(id: "ABC123", quote: SampleData.quote, loading: false))
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
