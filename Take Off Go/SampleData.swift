//
//  SampleQuote.swift
//  Take Off Go
//
//  Created by Brendan on 12/2/2022.
//

// TODO: move this back into Preview Content

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

    enum Countries {
        static var australiaD = GetQuoteQuery.Data.Quote.Trip.TripFlight.Node.DepartureAirport.Country(name: "Australia")
        static var australiaA = GetQuoteQuery.Data.Quote.Trip.TripFlight.Node.ArrivalAirport.Country(name: "Australia")
    }

    enum Airports {
        static var melD = GetQuoteQuery.Data.Quote.Trip.TripFlight.Node.DepartureAirport(
            id: "mel",
            latitude: 0,
            longitude: 0,
            iata: "MEL",
            icao: "YMML",
            timezone: "Australia/Melbourne",
            city: "Melbourne",
            country: Countries.australiaD)

        static var sydD = GetQuoteQuery.Data.Quote.Trip.TripFlight.Node.DepartureAirport(
            id: "syd",
            latitude: 0,
            longitude: 0,
            iata: "SYD",
            icao: "YSYL",
            timezone: "Australia/Sydney",
            city: "Sydney",
            country: Countries.australiaD)

        static var melA = GetQuoteQuery.Data.Quote.Trip.TripFlight.Node.ArrivalAirport(
            id: "mel",
            latitude: 0,
            longitude: 0,
            iata: "MEL",
            icao: "YMML",
            timezone: "Australia/Melbourne",
            city: "Melbourne",
            country: Countries.australiaA)

        static var sydA = GetQuoteQuery.Data.Quote.Trip.TripFlight.Node.ArrivalAirport(
            id: "syd",
            latitude: 0,
            longitude: 0,
            iata: "SYD",
            icao: "YSYL",
            timezone: "Australia/Sydney",
            city: "Sydney",
            country: Countries.australiaA)
    }

    static var trip = GetQuoteQuery.Data.Quote.Trip(
        name: "",
        agency: nil,
        agencyMember: nil,
        tripFlights: GetQuoteQuery.Data.Quote.Trip.TripFlight(nodes: [
            GetQuoteQuery.Data.Quote.Trip.TripFlight.Node(
                id: "0",
                arrival: "2022-02-17T14:20:00",
                carrier: "QF",
                departure: "2022-02-17T12:00:00",
                number: "123",
                departureAirport: Airports.melD,
                arrivalAirport: Airports.sydA),
            GetQuoteQuery.Data.Quote.Trip.TripFlight.Node(
                id: "1",
                arrival: "2022-02-18T14:20:00",
                carrier: "QF",
                departure: "2022-02-18T12:00:00",
                number: "321",
                departureAirport: Airports.sydD,
                arrivalAirport: Airports.melA),
        ]))

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
                quoteDayDestinationsByDayId: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId(nodes: [
                    GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId.Node(order: 0, destination: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId.Node.Destination(id: "0", name: "Arusha")),
                    GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId.Node(order: 1, destination: GetQuoteQuery.Data.Quote.Day.Node.QuoteDayDestinationsByDayId.Node.Destination(id: "1", name: "Kilimanjaro")),
                ])),
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

    enum Trips {
        static var loading = TripViewModel(id: "loading", quote: nil, loading: true, error: false)
        static var error = TripViewModel(id: "error", quote: nil, loading: false, error: true)
        static var success = TripViewModel(id: "success", quote: quote, loading: false, error: false)
    }
}
