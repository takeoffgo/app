//
//  TripOverviewView.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import SwiftUI

struct TripOverviewView: View {
    @State private var detailedView = false // TODO: find a UI mechanism to toggle this

    var quote: GetQuoteQuery.Data.Quote

    var body: some View {
        List {
            ForEach(quote.days.nodesWrapped(quote: quote)) { day in
                Section(day.dateDisplay) {
                    VStack(alignment: .leading, spacing: 4) {
                        if !day.destinations.isEmpty {
                            Text(day.destinations)
                                .font(.caption)
                        }

                        if detailedView {
                            MarkdownView(source: day.detail)
                        } else {
                            MarkdownView(source: day.summary)
                        }
                    }

                    if day.property != nil {
                        self.property(day: day)
                    }
                }
            }
        }
    }

    func property(day: GetQuoteQuery.Data.Quote.Day.DayWrapper) -> some View {
        NavigationLink(destination: PropertyView(property: day.property!)) {
            VStack(alignment: .leading, spacing: 4) {
                Text(day.property!.name!)

                if day.accommodation?.roomType?.isEmpty == false {
                    Text(day.accommodation!.roomType!)
                        .font(.caption)
                }
            }
        }
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
        var quote: GetQuoteQuery.Data.Quote

        private var date: Date? { return node.date?.date() }

        var dateDisplay: String {
            if date != nil, dayCount() == 1 {
                return date!.string(dateStyle: .full)
            }

            if let dr = dateRange() {
                return dr.string(dateStyle: .full, timeStyle: DateIntervalFormatter.Style.none)
            }

            return ""
        }

        var summary: String {
            return node.activitySummary?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        }

        var detail: String {
            return node.activityDetail?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        }

        var destinations: String {
            if node.quoteDayDestinationsByDayId.nodes.isEmpty {
                return ""
            }

            let destinations = node.quoteDayDestinationsByDayId.nodes
                .map { $0?.destination?.name }
                .filter { $0?.isEmpty == false }
                .map { $0! }

            return ListFormatter.localizedString(byJoining: destinations)
        }

        var property: GetQuoteQuery.Data.Quote.Accommodation.Node.Property? {
            return accommodation?.property
        }

        var accommodation: GetQuoteQuery.Data.Quote.Accommodation.Node? {
            if node.accommodationId == nil {
                return nil
            }

            return quote.accommodation.nodes.filter { $0!.id == node.accommodationId }.first! ?? nil
        }

        func skip() -> Bool {
            guard let startIndex = quote.days.nodes.firstIndex(where: { $0?.id == node.id }) else { return false }

            if startIndex == 0 {
                return false
            }

            let prev = quote.days.nodes[startIndex - 1]!

            let ret = node.accommodationId == prev.accommodationId &&
                (node.activitySummary == prev.activitySummary ||
                    (prev.activitySummary?.isEmpty == true &&
                        node.activitySummary?.isEmpty == true))

            print("skip?: \(ret), idx: \(startIndex)")
            return ret
        }

        private func dateRange() -> DateInterval? {
            if date != nil {
                let dayComponent = DateComponents(day: dayCount() - 1)
                let endDate = Calendar.current.date(byAdding: dayComponent, to: date!)

                return DateInterval(start: date!, end: endDate!)
            }

            return nil
        }

        private func dayCount() -> Int {
            guard let startIndex = quote.days.nodes.firstIndex(where: { $0?.id == node.id }) else { return 1 }
            var ret = 1

            for i in startIndex + 1 ..< quote.days.nodes.count {
                let n = quote.days.nodes[i]

                if n?.accommodationId != node.accommodationId {
                    break
                }

                if n?.activitySummary == summary {
                    ret = ret + 1
                }
            }

            return ret
        }
    }

    func nodesWrapped(quote: GetQuoteQuery.Data.Quote) -> [DayWrapper] {
        return nodes.enumerated()
            .map { DayWrapper(id: $0, node: $1!, quote: quote) }
            .filter { !$0.skip() }
    }
}
