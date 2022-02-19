//
//  TripAccommodationView.swift
//  Take Off Go
//
//  Created by Brendan on 16/2/2022.
//

import SwiftUI

struct TripAccommodationView: View {
    var quote: GetQuoteQuery.Data.Quote

    var body: some View {
        List {
            ForEach(quote.accommodationWrapper()) { acc in
                NavigationLink(destination: PropertyView(property: acc.property)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(acc.source.property!.name!)

                        if acc.nights > 0 || !acc.roomType.isEmpty {
                            HStack {
                                if acc.nights > 0 {
                                    Text("\(acc.nights) nights")
                                }
                                if !acc.roomType.isEmpty {
                                    Text(acc.roomType)
                                }
                            }
                            .font(.caption)
                        }
                    }
                }
            }
        }
    }
}

struct TripAccommodationView_Previews: PreviewProvider {
    static var previews: some View {
        TripAccommodationView(quote: SampleData.quote)
    }
}

extension GetQuoteQuery.Data.Quote {
    func accommodationWrapper() -> [Accomomdation] {
        return accommodation.nodes.enumerated().map { Accomomdation(source: $1!, quote: self) }
    }
}

