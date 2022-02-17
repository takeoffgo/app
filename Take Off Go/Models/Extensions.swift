//
//  Extensions.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import Foundation
import SwiftUI

public extension Date {
    func string(dateStyle: DateFormatter.Style? = nil, timeStyle: DateFormatter.Style? = nil) -> String {
        let formatOut = DateFormatter()
        if dateStyle != nil {
            formatOut.dateStyle = dateStyle!
        }
        if timeStyle != nil {
            formatOut.timeStyle = timeStyle!
        }

        return formatOut.string(from: self)
    }
}

public extension DateInterval {
    func string(dateStyle: DateIntervalFormatter.Style? = nil, timeStyle: DateIntervalFormatter.Style? = nil) -> String {
        let formatOut = DateIntervalFormatter()
        if dateStyle != nil {
            formatOut.dateStyle = dateStyle!
        }
        if timeStyle != nil {
            formatOut.timeStyle = timeStyle!
        }

        return formatOut.string(from: self) ?? ""
    }
}

public extension String {
    func date() -> Date? {
        let formatIn = DateFormatter()
        formatIn.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"

        return formatIn.date(from: self)
    }
}

public extension GetQuoteQuery.Data.Quote {
    var startDate: Date? { return self.start?.date() }
}

extension Image {
    static func fromHash(hash: String) -> Image {
        let folder = try! FileManager.default
            .url(for: .picturesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

        let pathUrl = folder.appendingPathComponent(hash)

        if FileManager.default.fileExists(atPath: pathUrl.path) {
            return Image(uiImage: UIImage(contentsOfFile: pathUrl.path)!)
        }

        print("\(hash) doesn't exist")
        return Image(systemName: "heart.fill")
    }
}
