//
//  Accomomdation.swift
//  Take Off Go
//
//  Created by Brendan on 19/2/2022.
//

import Foundation

struct Accomomdation: Identifiable {
    var id: String { source.id }
    var source: GetQuoteQuery.Data.Quote.Accommodation.Node
    var quote: GetQuoteQuery.Data.Quote

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
