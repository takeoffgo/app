//
//  TripOverviewView.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import SwiftUI

struct TripOverviewView: View {
    var quote: GetQuoteQuery.Data.Quote

    func accommodation(id: String) -> GetQuoteQuery.Data.Quote.Accommodation.Node? {
        return quote.accommodation.nodes.filter { $0!.id == id }.first! ?? nil
    }

    var body: some View {
        List {
            ForEach(quote.days.nodesWrapped()) { day in
                Section(day.node.dateDate!.string(dateStyle: .full)) {
                    VStack(alignment: .leading) {
                        Text(day.node.activitySummary?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                    }
                    if day.node.accommodationId != nil {
                        NavigationLink(destination: PropertyView(property: accommodation(id: day.node.accommodationId!)!.property!)) {
                            Text(accommodation(id: day.node.accommodationId!)!.property!.name!)
                        }
                    }
                }
            }

            Spacer()
        }
        .navigationTitle("Overview")
    }
}

struct TripOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripOverviewView(quote: SampleData.quote)
        }
    }
}

extension GetQuoteQuery.Data.Quote.Day {
    struct DayWrapper: Identifiable {
        var id: Int

        var node: GetQuoteQuery.Data.Quote.Day.Node
    }

    func nodesWrapped() -> [DayWrapper] {
        return nodes.enumerated().map { DayWrapper(id: $0, node: $1!) }
    }
}
