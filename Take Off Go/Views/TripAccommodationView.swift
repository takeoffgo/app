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
    func accommodationWrapper() -> [AccomomdationWrapper] {
        return accommodation.nodes.enumerated().map { AccomomdationWrapper(source: $1!, quote: self) }
    }
}

struct AccomomdationWrapper: Identifiable {
    var id: Int
    var source: GetQuoteQuery.Data.Quote.Accommodation.Node
    var quote: GetQuoteQuery.Data.Quote

    init(source: GetQuoteQuery.Data.Quote.Accommodation.Node, quote: GetQuoteQuery.Data.Quote) {
        self.id = source.order
        self.source = source
        self.quote = quote
    }

    var property: GetQuoteQuery.Data.Quote.Accommodation.Node.Property { return source.property! }

    var nights: Int {
        return quote.days.nodes
            .filter { $0?.accommodationId == source.id }
            .count
    }

    var roomType: String! {
        return source.roomType ?? ""
    }
}
