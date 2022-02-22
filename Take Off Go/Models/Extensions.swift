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
    func date(timeZone: String? = nil) -> Date? {
        let formatIn = DateFormatter()
        formatIn.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        if !(timeZone ?? "").isEmpty {
            formatIn.timeZone = TimeZone(identifier: timeZone!)
        }

        return formatIn.date(from: self)
    }
}

public extension GetQuoteQuery.Data.Quote {
    var startDate: Date? { return self.start?.date() }
}

extension Image {
    static func fromHash(hash: String) -> Image {
        let folder = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("com.takeoffgo.app")

        let pathUrl = folder.appendingPathComponent(hash)

        if FileManager.default.fileExists(atPath: pathUrl.path) {
            let uiImage = UIImage(contentsOfFile: pathUrl.path)
            if uiImage != nil {
                return Image(uiImage: uiImage!)
            }
        }

        print("\(hash) doesn't exist at \(pathUrl.path)")
        return Image(systemName: "heart.fill")
    }
}
