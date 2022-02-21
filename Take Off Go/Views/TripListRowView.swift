//
//  TripListRow.swift
//  Take Off Go
//
//  Created by Brendan on 12/2/2022.
//

import SwiftUI

struct TripListRowView: View {
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
                        Image.fromHash(hash: trip.quote!.hero!.image!.hash!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//                        FullWidthImage(hash: trip.quote!.hero!.image!.hash!)
                    }
                    Text(trip.quote?.hero?.title ?? trip.id)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                NavigationLink(destination: TripDetailView(trip: trip)) {
                    EmptyView()
                }
                .opacity(0)
            }.listRowInsets(EdgeInsets())
        }
    }
}

struct TripListRow_Previews: PreviewProvider {
    static var previews: some View {
        TripListRowView(trip: TripViewModel(id: "ABC123", quote: nil))
            .previewLayout(.fixed(width: 400, height: 200))

        TripListRowView(trip: TripViewModel(id: "ABC123", quote: SampleData.quote, loading: false))
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
