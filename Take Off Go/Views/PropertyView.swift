//
//  PropertyView.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import MapKit
import SwiftUI

struct ImageSliderView: View {
    var images: [String]

    var body: some View {
        if images.isEmpty {
            EmptyView()
        } else if images.count == 1 {
            Image.fromHash(hash: images[0])
                .resizable()
                .scaledToFill()

        } else {
            TabView {
                ForEach(images, id: \.self) { image in
                    Image.fromHash(hash: image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct PropertyView: View {
    init(property: GetQuoteQuery.Data.Quote.Accommodation.Node.Property) {
        self.property = PropertyWrapper(source: property)
    }

    var property: PropertyWrapper

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(property.name)
                    .font(.title)
                    .padding()

                ImageSliderView(images: property.images)
                    .frame(height: 300)

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

struct PropertyWrapper: Identifiable {
    var id: UUID = .init()

    var source: GetQuoteQuery.Data.Quote.Accommodation.Node.Property

    var name: String { self.source.name! }
    var summary: String { self.source.summary ?? "" }

    var images: [String] {
        var ret = [self.source.heroMedia?.hash]
        ret.append(contentsOf: self.source.gallery?.mediaGalleryItems.nodes.map { $0?.mediaItem?.hash } ?? [])

        return ret.filter { !($0 ?? "").isEmpty }.map { $0! }
    }

    var location: CLLocationCoordinate2D? {
        if self.source.latitude != nil, self.source.longitude != nil {
            return CLLocationCoordinate2D(
                latitude: self.source.latitude!,
                longitude: self.source.longitude!)
        }

        return nil
    }
}
