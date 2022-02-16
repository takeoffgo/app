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
                    VStack(alignment: .leading) {
                        HStack {
                            Text(flight.source.departureAirport!.iata!)
                            Text("to")
                            Text(flight.source.arrivalAirport!.iata!)
                        }
                        Text("Departing \(flight.source.departure)")
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
}
