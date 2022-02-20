//
//  Property.swift
//  Take Off Go
//
//  Created by Brendan on 19/2/2022.
//

import Foundation
import MapKit

struct Property: Identifiable {
    var id: String { self.source.id }

    var source: GetQuoteQuery.Data.Quote.Accommodation.Node.Property

    var name: String { self.source.name! }
    var summary: String { self.source.summary ?? "" }

    var images: [String] {
        var ret = [self.source.heroMedia?.hash]
        ret.append(contentsOf: self.source.gallery?.mediaGalleryItems.nodes.map { $0?.mediaItem?.hash } ?? [])

        return Array(Set(ret.filter { !($0 ?? "").isEmpty }.map { $0! }))
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
