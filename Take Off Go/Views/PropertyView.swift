//
//  PropertyView.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import SwiftUI

struct PropertyView: View {
    var property: GetQuoteQuery.Data.Quote.Accommodation.Node.Property

    var body: some View {
        Text("Property detail: \(property.name!)")
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(property:SampleData.Properties.arusha)
    }
}
