//
//  PropertyView.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import MapKit
import SwiftUI

struct PropertyView: View {
    var property: GetQuoteQuery.Data.Quote.Accommodation.Node.Property

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(property.name!)
                    .font(.title)
                    .padding()

                if property.heroMedia?.hash != nil {
                    Image.fromHash(hash: property.heroMedia!.hash!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                MarkdownView(source: property.summary)
                    .padding()
            }

            if property.latitude != nil && property.longitude != nil {
                Map(
                    coordinateRegion: .constant(MKCoordinateRegion(
                        center: property.location(),
                        latitudinalMeters: 10000,
                        longitudinalMeters: 10000)),
                    interactionModes: .all,
                    annotationItems: [property.location()]) { pin in
                        MapPin(coordinate: pin, tint: .accentColor)
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

extension GetQuoteQuery.Data.Quote.Accommodation.Node.Property {
    func location() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: self.latitude!,
            longitude: self.longitude!)
    }
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: UUID {
        return UUID()
    }
}
