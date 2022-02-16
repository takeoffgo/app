//
//  TripDaysView.swift
//  Take Off Go
//
//  Created by Brendan on 16/2/2022.
//

import SwiftUI

struct TripDaysView: View {
    var quote: GetQuoteQuery.Data.Quote

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TripDaysView_Previews: PreviewProvider {
    static var previews: some View {
        TripDaysView(quote: SampleData.quote)
    }
}
