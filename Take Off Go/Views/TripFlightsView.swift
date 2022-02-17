//
//  TripFlightsView.swift
//  Take Off Go
//
//  Created by Brendan on 16/2/2022.
//

import SwiftUI

struct TripFlightsView: View {
    var quote: GetQuoteQuery.Data.Quote

    var body: some View {
        if quote.trip?.tripFlights.nodes.count == 0 {
            VStack {
                Text("There are no flights associated with this trip.")
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Please contact your agent if you believe this to be a mistake.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        } else {
            List {
                ForEach(quote.trip!.flightsWrapper(), id: \.id) { flight in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(flight.cities)
                            Text(flight.countries)

                            Text(flight.date)
                                .font(.caption)
                        }
                        Spacer()
                        Text(flight.number)
                            .font(.system(.body, design: .monospaced))
                            .padding(4)
                            .background(.gray)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct TripFlightsView_Previews: PreviewProvider {
    static var previews: some View {
        TripFlightsView(quote: SampleData.quote)
    }
}

extension GetQuoteQuery.Data.Quote.Trip {
    func flightsWrapper() -> [TripFlightWrapper] {
        return self.tripFlights.nodes.enumerated().map { TripFlightWrapper(id: $0, source: $1!) }
    }
}

struct TripFlightWrapper: Identifiable {
    var id: Int
    var source: GetQuoteQuery.Data.Quote.Trip.TripFlight.Node

    var cities: String {
        return "\(self.source.departureAirport!.city!) to \(self.source.arrivalAirport!.city!)"
    }

    var countries: String {
        if self.source.departureAirport?.country?.name == self.source.arrivalAirport?.country?.name {
            return self.source.departureAirport!.country!.name!
        }

        return "\(self.source.departureAirport!.country!.name!) to \(self.source.arrivalAirport!.country!.name!)"
    }

    var date: String {
        let departure = self.source.departure.date()
        let arrival = self.source.arrival.date()
        if departure != nil, arrival != nil {
            let dateStr = departure!.string(dateStyle: .short, timeStyle: .short)

            return dateStr
        }

        return ""
    }

    var number: String {
        if !(self.source.carrier ?? "").isEmpty, !(self.source.number ?? "").isEmpty {
            return "\(self.source.carrier!) \(self.source.number!)"
        }

        return ""
    }
}
