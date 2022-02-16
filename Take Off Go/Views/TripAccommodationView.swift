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
                Text(acc.source.property!.name!)
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
    func accommodationWrapper() -> [AccomomdationWrapper] {
        return self.accommodation.nodes.enumerated().map { AccomomdationWrapper(id: $0, source: $1!) }
    }
}

struct AccomomdationWrapper: Identifiable {
    var id: Int
    var source: GetQuoteQuery.Data.Quote.Accommodation.Node
}
