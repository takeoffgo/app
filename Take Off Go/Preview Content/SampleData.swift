//
//  SampleQuote.swift
//  Take Off Go
//
//  Created by Brendan on 12/2/2022.
//

import Foundation

struct SampleData {
    enum Properties {
        static var arusha = GetQuoteQuery.Data.Quote.Accommodation.Node.Property(
            id: "arusha",
            name: "Arusha Coffee Lodge",
            summary: "Located in the middle of a verdant coffee plantation, Arusha Coffee Lodge is a sanctuary of aromatic tranquillity and a welcome retreat after a long international flight, or the dust and excitement of a thrilling bush safari.",
            latitude: -3.375,
            longitude: 36.675,
            heroMedia: GetQuoteQuery.Data.Quote.Accommodation.Node.Property.HeroMedium(hash: "5b92b3767c8c206655ca3d410a88ca97"))

        static var fourSeasons = GetQuoteQuery.Data.Quote.Accommodation.Node.Property(
            id: "fourSeasons",
            name: "Four Seasons Safari Lodge",
            summary: "Experience thrilling Serengeti game drives and rare opportunities to connect with the local people and culture. Then return to the Safari Lodge located in Serengeti National Park, where our secluded guest rooms, elegant spa, and infinity pool promise a luxurious respite during your African safari adventures.",
            latitude: 0,
            longitude: 0,
            heroMedia: GetQuoteQuery.Data.Quote.Accommodation.Node.Property.HeroMedium(hash: "77515037d98cbb7ebec9c9df56e6081e"))
    }

    static var trip = GetQuoteQuery.Data.Quote.Trip(name: "", agency: nil, agencyMember: nil, tripFlights: GetQuoteQuery.Data.Quote.Trip.TripFlight(nodes: []))

    static var quote = GetQuoteQuery.Data.Quote(
        id: "0",
        status: 0,
        start: "2022-06-12T00:00:00",
        duration: 12,
        travellerCount: 2,
        total: nil,
        baseCurrency: nil,
        inclusions: nil,
        exclusions: nil,
        expires: nil,
        locked: nil,
        hero: GetQuoteQuery.Data.Quote.Hero(
            title: "Botswana in Depth",
            subtitle: "A diverse trip which explores the diverse regions of Botswana. The vast Kalahari, and the wilds of the Okavango Delta and Chobe National Park",
            image: GetQuoteQuery.Data.Quote.Hero.Image(
                hash: "f754b3899622beeef21c4fbde473150f")),
        user: nil,
        trip: trip,
        days: GetQuoteQuery.Data.Quote.Day(nodes: [
            GetQuoteQuery.Data.Quote.Day.Node(
                id: "0",
                date: "2022-12-11T00:00:00",
                order: 0,
                activitySummary: """
                Meet & Greet - Assistance
                Transfer to Arusha Coffee Lodge
                Dinner (Not Included)
                """,
                activityDetail: "",
                accommodationId: "arusha",
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [])),
            GetQuoteQuery.Data.Quote.Day.Node(
                id: "1",
                date: "2022-12-12T00:00:00",
                order: 1,
                activitySummary: """
                Transfer - Arusha - Kilimanjaro - Vehicle/Guide
                Air - Arusha - Serengeti Seronera Airstrip [Scheduled Charter (2 hr)]- Standard
                Lodge Airport Transfer
                Lunch (included)
                Park Fees
                Dinner (included)
                """,
                activityDetail: "",
                accommodationId: "fourSeasons",
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [])),
            GetQuoteQuery.Data.Quote.Day.Node(
                id: "2",
                date: "2022-12-13T00:00:00",
                order: 2,
                activitySummary: """
                Morning Game Drive
                Lunch (included)
                Afternoon Game Drive
                Park Fees
                Dinner (included)
                """,
                activityDetail: "",
                accommodationId: "fourSeasons",
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [])),
            GetQuoteQuery.Data.Quote.Day.Node(
                id: "3",
                date: "2022-12-14T00:00:00",
                order: 3,
                activitySummary: """
                Morning Game Drive
                Lunch (included)
                Afternoon Game Drive
                Park Fees
                Dinner (included)
                """,
                activityDetail: "",
                accommodationId: "fourSeasons",
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [])),
            GetQuoteQuery.Data.Quote.Day.Node(
                id: "4",
                date: "2022-12-15T00:00:00",
                order: 4,
                activitySummary: """
                Morning Game Drive
                Lunch (included)
                Afternoon Game Drive
                Park Fees
                Dinner (included)
                """,
                activityDetail: "",
                accommodationId: "fourSeasons",
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [])),
            GetQuoteQuery.Data.Quote.Day.Node(
                id: "5",
                date: "2022-12-16T00:00:00",
                order: 5,
                activitySummary: """
                Morning Game Drive
                Lunch (included)
                Afternoon Game Drive
                Park Fees
                Dinner (included)
                """,
                activityDetail: "",
                accommodationId: "fourSeasons",
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [])),
        ]),
        accommodation: GetQuoteQuery.Data.Quote.Accommodation(nodes: [
            GetQuoteQuery.Data.Quote.Accommodation.Node(
                id: "arusha",
                order: 0,
                basis: "",
                confirmation: "",
                beverageInclusions: [],
                foodInclusions: ["Breakfast"],
                roomType: "Suite",
                property: Properties.arusha),
            GetQuoteQuery.Data.Quote.Accommodation.Node(
                id: "fourSeasons",
                order: 1,
                basis: "",
                confirmation: "",
                beverageInclusions: ["Local"],
                foodInclusions: ["Breakfast", "Lunch", "Dinner"],
                roomType: "One bedroom villa",
                property: Properties.fourSeasons),

        ]))
}
