//
//  Extensions.swift
//  Take Off Go
//
//  Created by Brendan on 13/2/2022.
//

import Foundation

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

public extension String {
    func date() -> Date {
        let formatIn = DateFormatter()
        formatIn.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"

        return formatIn.date(from: self)!
    }
}

public extension GetQuoteQuery.Data.Quote {
    var startDate: Date? { return self.start?.date() }
}

public extension GetQuoteQuery.Data.Quote.Day.Node {
    var dateDate: Date? { return self.date?.date() }
}
