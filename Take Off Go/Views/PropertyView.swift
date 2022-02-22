//
//  PropertyView.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import MapKit
import SwiftUI

struct PropertyView: View {
    init(property: GetQuoteQuery.Data.Quote.Accommodation.Node.Property) {
        self.property = Property(source: property)
    }

    var property: Property

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(property.name)
                    .font(.title)
                    .padding()

                ImageSliderView(images: property.images)
                    .aspectRatio(16 / 9, contentMode: .fill)

                if !property.summary.isEmpty {
                    MarkdownView(source: property.summary)
                        .padding()
                }
            }

            if property.location != nil {
                Map(
                    coordinateRegion: .constant(MKCoordinateRegion(
                        center: property.location!,
                        latitudinalMeters: 10000,
                        longitudinalMeters: 10000)),
                    interactionModes: .all,
                    annotationItems: [property]) { pin in
                        MapPin(coordinate: pin.location!, tint: .accentColor)
                    }
                    .frame(height: 400)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(property: SampleData.Properties.arusha)
    }
}
