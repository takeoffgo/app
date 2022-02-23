//
//  Trip.swift
//  Take Off Go
//
//  Created by Brendan on 23/2/2022.
//

import Foundation

struct Quote {
    var source: GetQuoteQuery.Data.Quote

    var title: String {
        if (source.hero?.title ?? "").isEmpty {
            return ""
        }

        return source.hero!.title!
    }

    var subtitle: String {
        if (source.hero?.subtitle ?? "").isEmpty {
            return ""
        }

        return source.hero!.subtitle!
    }

    var heroImage: String {
        if source.hero?.image?.hash != nil {
            return source.hero!.image!.hash!
        }

        return ""
    }

    var caption: String {
        if source.startDate != nil {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full // or .short or .abbreviated
            formatter.allowedUnits = [.year, .month, .day]

            let daysFromNowStr = formatter.string(
                from: source.startDate! > Date.now ? Date.now : source.startDate!,
                to: source.startDate! > Date.now ? source.startDate! : Date.now
            )!

            if source.startDate! > Date.now {
                return "Starts in \(daysFromNowStr) on \(source.startDate!.string(dateStyle: .full)) for \(String(source.duration!)) days"
            } else {
                return "Started \(daysFromNowStr) ago on \(source.startDate!.string(dateStyle: .full)) for \(String(source.duration!)) days"
            }
        }

        return ""
    }
}
