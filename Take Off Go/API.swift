// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetQuoteQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetQuote($key: String!) {
      quote: quotePublic(key: $key) {
        __typename
        id
        status
        start
        duration
        travellerCount
        total
        baseCurrency
        inclusions
        exclusions
        expires
        locked
        hero {
          __typename
          title
          subtitle
          image {
            __typename
            hash
          }
        }
        user {
          __typename
          lastName
          firstName
          email
          phone
          genderPreposition
        }
        trip {
          __typename
          name
          agency {
            __typename
            name
            logo {
              __typename
              hash
            }
          }
          agencyMember {
            __typename
            lastName
            firstName
            phone
            email
            genderPreposition
          }
          tripFlights(orderBy: DEPARTURE_ASC) {
            __typename
            nodes {
              __typename
              id
              arrival
              carrier
              departure
              number
              departureAirport {
                __typename
                id
                latitude
                longitude
                iata
                icao
                timezone
                city
                country {
                  __typename
                  name
                }
              }
              arrivalAirport {
                __typename
                id
                latitude
                longitude
                iata
                icao
                timezone
                city
                country {
                  __typename
                  name
                }
              }
            }
          }
        }
        days: quoteDaysByQuoteId(orderBy: ORDER_ASC) {
          __typename
          nodes {
            __typename
            id
            date
            order
            activitySummary
            activityDetail
            accommodationId
            quoteDayDestinationsByDayId(orderBy: ORDER_ASC) {
              __typename
              nodes {
                __typename
                order
                destination {
                  __typename
                  id
                  name
                }
              }
            }
          }
        }
        accommodation: quoteAccommodationDetailsByQuoteId(orderBy: ORDER_ASC) {
          __typename
          nodes {
            __typename
            id
            order
            basis
            confirmation
            beverageInclusions
            foodInclusions
            roomType
            property {
              __typename
              id
              name
              summary
              city
              country {
                __typename
                id
                name
              }
              latitude
              longitude
              heroMedia {
                __typename
                hash
              }
              gallery {
                __typename
                mediaGalleryItems {
                  __typename
                  nodes {
                    __typename
                    mediaItem {
                      __typename
                      hash
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetQuote"

  public var key: String

  public init(key: String) {
    self.key = key
  }

  public var variables: GraphQLMap? {
    return ["key": key]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("quotePublic", alias: "quote", arguments: ["key": GraphQLVariable("key")], type: .object(Quote.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(quote: Quote? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "quote": quote.flatMap { (value: Quote) -> ResultMap in value.resultMap }])
    }

    public var quote: Quote? {
      get {
        return (resultMap["quote"] as? ResultMap).flatMap { Quote(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "quote")
      }
    }

    public struct Quote: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["QuotePublic"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("start", type: .scalar(String.self)),
          GraphQLField("duration", type: .scalar(Int.self)),
          GraphQLField("travellerCount", type: .scalar(Int.self)),
          GraphQLField("total", type: .scalar(String.self)),
          GraphQLField("baseCurrency", type: .scalar(String.self)),
          GraphQLField("inclusions", type: .scalar(String.self)),
          GraphQLField("exclusions", type: .scalar(String.self)),
          GraphQLField("expires", type: .scalar(String.self)),
          GraphQLField("locked", type: .scalar(String.self)),
          GraphQLField("hero", type: .object(Hero.selections)),
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("trip", type: .object(Trip.selections)),
          GraphQLField("quoteDaysByQuoteId", alias: "days", arguments: ["orderBy": "ORDER_ASC"], type: .nonNull(.object(Day.selections))),
          GraphQLField("quoteAccommodationDetailsByQuoteId", alias: "accommodation", arguments: ["orderBy": "ORDER_ASC"], type: .nonNull(.object(Accommodation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, status: Int? = nil, start: String? = nil, duration: Int? = nil, travellerCount: Int? = nil, total: String? = nil, baseCurrency: String? = nil, inclusions: String? = nil, exclusions: String? = nil, expires: String? = nil, locked: String? = nil, hero: Hero? = nil, user: User? = nil, trip: Trip? = nil, days: Day, accommodation: Accommodation) {
        self.init(unsafeResultMap: ["__typename": "QuotePublic", "id": id, "status": status, "start": start, "duration": duration, "travellerCount": travellerCount, "total": total, "baseCurrency": baseCurrency, "inclusions": inclusions, "exclusions": exclusions, "expires": expires, "locked": locked, "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "trip": trip.flatMap { (value: Trip) -> ResultMap in value.resultMap }, "days": days.resultMap, "accommodation": accommodation.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: Int? {
        get {
          return resultMap["status"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var start: String? {
        get {
          return resultMap["start"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "start")
        }
      }

      public var duration: Int? {
        get {
          return resultMap["duration"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "duration")
        }
      }

      public var travellerCount: Int? {
        get {
          return resultMap["travellerCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "travellerCount")
        }
      }

      public var total: String? {
        get {
          return resultMap["total"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "total")
        }
      }

      public var baseCurrency: String? {
        get {
          return resultMap["baseCurrency"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "baseCurrency")
        }
      }

      public var inclusions: String? {
        get {
          return resultMap["inclusions"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "inclusions")
        }
      }

      public var exclusions: String? {
        get {
          return resultMap["exclusions"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "exclusions")
        }
      }

      public var expires: String? {
        get {
          return resultMap["expires"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "expires")
        }
      }

      public var locked: String? {
        get {
          return resultMap["locked"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locked")
        }
      }

      /// Reads a single `QuoteHero` that is related to this `QuotePublic`.
      public var hero: Hero? {
        get {
          return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "hero")
        }
      }

      /// Reads a single `User` that is related to this `QuotePublic`.
      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      /// Reads a single `Trip` that is related to this `QuotePublic`.
      public var trip: Trip? {
        get {
          return (resultMap["trip"] as? ResultMap).flatMap { Trip(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "trip")
        }
      }

      /// Reads and enables pagination through a set of `QuoteDay`.
      public var days: Day {
        get {
          return Day(unsafeResultMap: resultMap["days"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "days")
        }
      }

      /// Reads and enables pagination through a set of `QuoteAccommodationDetail`.
      public var accommodation: Accommodation {
        get {
          return Accommodation(unsafeResultMap: resultMap["accommodation"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "accommodation")
        }
      }

      public struct Hero: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["QuoteHero"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("subtitle", type: .scalar(String.self)),
            GraphQLField("image", type: .object(Image.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String? = nil, subtitle: String? = nil, image: Image? = nil) {
          self.init(unsafeResultMap: ["__typename": "QuoteHero", "title": title, "subtitle": subtitle, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var subtitle: String? {
          get {
            return resultMap["subtitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subtitle")
          }
        }

        /// Reads a single `MediaItem` that is related to this `QuoteHero`.
        public var image: Image? {
          get {
            return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "image")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaItem"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hash", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hash: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaItem", "hash": hash])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var hash: String? {
            get {
              return resultMap["hash"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "hash")
            }
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .scalar(String.self)),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("genderPreposition", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastName: String? = nil, firstName: String? = nil, email: String? = nil, phone: String? = nil, genderPreposition: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "lastName": lastName, "firstName": firstName, "email": email, "phone": phone, "genderPreposition": genderPreposition])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var genderPreposition: String? {
          get {
            return resultMap["genderPreposition"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "genderPreposition")
          }
        }
      }

      public struct Trip: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Trip"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("agency", type: .object(Agency.selections)),
            GraphQLField("agencyMember", type: .object(AgencyMember.selections)),
            GraphQLField("tripFlights", arguments: ["orderBy": "DEPARTURE_ASC"], type: .nonNull(.object(TripFlight.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, agency: Agency? = nil, agencyMember: AgencyMember? = nil, tripFlights: TripFlight) {
          self.init(unsafeResultMap: ["__typename": "Trip", "name": name, "agency": agency.flatMap { (value: Agency) -> ResultMap in value.resultMap }, "agencyMember": agencyMember.flatMap { (value: AgencyMember) -> ResultMap in value.resultMap }, "tripFlights": tripFlights.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// Reads a single `Agency` that is related to this `Trip`.
        public var agency: Agency? {
          get {
            return (resultMap["agency"] as? ResultMap).flatMap { Agency(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "agency")
          }
        }

        /// Reads a single `AgencyMember` that is related to this `Trip`.
        public var agencyMember: AgencyMember? {
          get {
            return (resultMap["agencyMember"] as? ResultMap).flatMap { AgencyMember(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "agencyMember")
          }
        }

        /// Reads and enables pagination through a set of `TripFlight`.
        public var tripFlights: TripFlight {
          get {
            return TripFlight(unsafeResultMap: resultMap["tripFlights"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "tripFlights")
          }
        }

        public struct Agency: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Agency"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("logo", type: .object(Logo.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, logo: Logo? = nil) {
            self.init(unsafeResultMap: ["__typename": "Agency", "name": name, "logo": logo.flatMap { (value: Logo) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// Reads a single `MediaItem` that is related to this `Agency`.
          public var logo: Logo? {
            get {
              return (resultMap["logo"] as? ResultMap).flatMap { Logo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "logo")
            }
          }

          public struct Logo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaItem"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("hash", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(hash: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MediaItem", "hash": hash])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var hash: String? {
              get {
                return resultMap["hash"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "hash")
              }
            }
          }
        }

        public struct AgencyMember: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AgencyMember"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastName", type: .scalar(String.self)),
              GraphQLField("firstName", type: .scalar(String.self)),
              GraphQLField("phone", type: .scalar(String.self)),
              GraphQLField("email", type: .scalar(String.self)),
              GraphQLField("genderPreposition", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastName: String? = nil, firstName: String? = nil, phone: String? = nil, email: String? = nil, genderPreposition: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "AgencyMember", "lastName": lastName, "firstName": firstName, "phone": phone, "email": email, "genderPreposition": genderPreposition])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lastName: String? {
            get {
              return resultMap["lastName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }

          public var firstName: String? {
            get {
              return resultMap["firstName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var phone: String? {
            get {
              return resultMap["phone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "phone")
            }
          }

          public var email: String? {
            get {
              return resultMap["email"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "email")
            }
          }

          public var genderPreposition: String? {
            get {
              return resultMap["genderPreposition"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "genderPreposition")
            }
          }
        }

        public struct TripFlight: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TripFlightsConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nodes", type: .nonNull(.list(.object(Node.selections)))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]) {
            self.init(unsafeResultMap: ["__typename": "TripFlightsConnection", "nodes": nodes.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of `TripFlight` objects.
          public var nodes: [Node?] {
            get {
              return (resultMap["nodes"] as! [ResultMap?]).map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["TripFlight"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("arrival", type: .nonNull(.scalar(String.self))),
                GraphQLField("carrier", type: .scalar(String.self)),
                GraphQLField("departure", type: .nonNull(.scalar(String.self))),
                GraphQLField("number", type: .scalar(String.self)),
                GraphQLField("departureAirport", type: .object(DepartureAirport.selections)),
                GraphQLField("arrivalAirport", type: .object(ArrivalAirport.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, arrival: String, carrier: String? = nil, departure: String, number: String? = nil, departureAirport: DepartureAirport? = nil, arrivalAirport: ArrivalAirport? = nil) {
              self.init(unsafeResultMap: ["__typename": "TripFlight", "id": id, "arrival": arrival, "carrier": carrier, "departure": departure, "number": number, "departureAirport": departureAirport.flatMap { (value: DepartureAirport) -> ResultMap in value.resultMap }, "arrivalAirport": arrivalAirport.flatMap { (value: ArrivalAirport) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var arrival: String {
              get {
                return resultMap["arrival"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "arrival")
              }
            }

            public var carrier: String? {
              get {
                return resultMap["carrier"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "carrier")
              }
            }

            public var departure: String {
              get {
                return resultMap["departure"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "departure")
              }
            }

            public var number: String? {
              get {
                return resultMap["number"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "number")
              }
            }

            /// Reads a single `Airport` that is related to this `TripFlight`.
            public var departureAirport: DepartureAirport? {
              get {
                return (resultMap["departureAirport"] as? ResultMap).flatMap { DepartureAirport(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "departureAirport")
              }
            }

            /// Reads a single `Airport` that is related to this `TripFlight`.
            public var arrivalAirport: ArrivalAirport? {
              get {
                return (resultMap["arrivalAirport"] as? ResultMap).flatMap { ArrivalAirport(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "arrivalAirport")
              }
            }

            public struct DepartureAirport: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Airport"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(String.self))),
                  GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
                  GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
                  GraphQLField("iata", type: .scalar(String.self)),
                  GraphQLField("icao", type: .scalar(String.self)),
                  GraphQLField("timezone", type: .scalar(String.self)),
                  GraphQLField("city", type: .scalar(String.self)),
                  GraphQLField("country", type: .object(Country.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String, latitude: Double, longitude: Double, iata: String? = nil, icao: String? = nil, timezone: String? = nil, city: String? = nil, country: Country? = nil) {
                self.init(unsafeResultMap: ["__typename": "Airport", "id": id, "latitude": latitude, "longitude": longitude, "iata": iata, "icao": icao, "timezone": timezone, "city": city, "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String {
                get {
                  return resultMap["id"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var latitude: Double {
                get {
                  return resultMap["latitude"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "latitude")
                }
              }

              public var longitude: Double {
                get {
                  return resultMap["longitude"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "longitude")
                }
              }

              public var iata: String? {
                get {
                  return resultMap["iata"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "iata")
                }
              }

              public var icao: String? {
                get {
                  return resultMap["icao"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "icao")
                }
              }

              public var timezone: String? {
                get {
                  return resultMap["timezone"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "timezone")
                }
              }

              public var city: String? {
                get {
                  return resultMap["city"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "city")
                }
              }

              /// Reads a single `Country` that is related to this `Airport`.
              public var country: Country? {
                get {
                  return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "country")
                }
              }

              public struct Country: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Country"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Country", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String? {
                  get {
                    return resultMap["name"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct ArrivalAirport: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Airport"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(String.self))),
                  GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
                  GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
                  GraphQLField("iata", type: .scalar(String.self)),
                  GraphQLField("icao", type: .scalar(String.self)),
                  GraphQLField("timezone", type: .scalar(String.self)),
                  GraphQLField("city", type: .scalar(String.self)),
                  GraphQLField("country", type: .object(Country.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String, latitude: Double, longitude: Double, iata: String? = nil, icao: String? = nil, timezone: String? = nil, city: String? = nil, country: Country? = nil) {
                self.init(unsafeResultMap: ["__typename": "Airport", "id": id, "latitude": latitude, "longitude": longitude, "iata": iata, "icao": icao, "timezone": timezone, "city": city, "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String {
                get {
                  return resultMap["id"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var latitude: Double {
                get {
                  return resultMap["latitude"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "latitude")
                }
              }

              public var longitude: Double {
                get {
                  return resultMap["longitude"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "longitude")
                }
              }

              public var iata: String? {
                get {
                  return resultMap["iata"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "iata")
                }
              }

              public var icao: String? {
                get {
                  return resultMap["icao"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "icao")
                }
              }

              public var timezone: String? {
                get {
                  return resultMap["timezone"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "timezone")
                }
              }

              public var city: String? {
                get {
                  return resultMap["city"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "city")
                }
              }

              /// Reads a single `Country` that is related to this `Airport`.
              public var country: Country? {
                get {
                  return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "country")
                }
              }

              public struct Country: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Country"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Country", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String? {
                  get {
                    return resultMap["name"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }
          }
        }
      }

      public struct Day: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["QuoteDaysConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.object(Node.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]) {
          self.init(unsafeResultMap: ["__typename": "QuoteDaysConnection", "nodes": nodes.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of `QuoteDay` objects.
        public var nodes: [Node?] {
          get {
            return (resultMap["nodes"] as! [ResultMap?]).map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["QuoteDay"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("date", type: .scalar(String.self)),
              GraphQLField("order", type: .nonNull(.scalar(Int.self))),
              GraphQLField("activitySummary", type: .scalar(String.self)),
              GraphQLField("activityDetail", type: .scalar(String.self)),
              GraphQLField("accommodationId", type: .scalar(String.self)),
              GraphQLField("quoteDayDestinationsByDayId", arguments: ["orderBy": "ORDER_ASC"], type: .nonNull(.object(QuoteDayDestinationsByDayId.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, date: String? = nil, order: Int, activitySummary: String? = nil, activityDetail: String? = nil, accommodationId: String? = nil, quoteDayDestinationsByDayId: QuoteDayDestinationsByDayId) {
            self.init(unsafeResultMap: ["__typename": "QuoteDay", "id": id, "date": date, "order": order, "activitySummary": activitySummary, "activityDetail": activityDetail, "accommodationId": accommodationId, "quoteDayDestinationsByDayId": quoteDayDestinationsByDayId.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var date: String? {
            get {
              return resultMap["date"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "date")
            }
          }

          public var order: Int {
            get {
              return resultMap["order"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "order")
            }
          }

          public var activitySummary: String? {
            get {
              return resultMap["activitySummary"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "activitySummary")
            }
          }

          public var activityDetail: String? {
            get {
              return resultMap["activityDetail"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "activityDetail")
            }
          }

          public var accommodationId: String? {
            get {
              return resultMap["accommodationId"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "accommodationId")
            }
          }

          /// Reads and enables pagination through a set of `QuoteDayDestination`.
          public var quoteDayDestinationsByDayId: QuoteDayDestinationsByDayId {
            get {
              return QuoteDayDestinationsByDayId(unsafeResultMap: resultMap["quoteDayDestinationsByDayId"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "quoteDayDestinationsByDayId")
            }
          }

          public struct QuoteDayDestinationsByDayId: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["QuoteDayDestinationsConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .nonNull(.list(.object(Node.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nodes: [Node?]) {
              self.init(unsafeResultMap: ["__typename": "QuoteDayDestinationsConnection", "nodes": nodes.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of `QuoteDayDestination` objects.
            public var nodes: [Node?] {
              get {
                return (resultMap["nodes"] as! [ResultMap?]).map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["QuoteDayDestination"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("order", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("destination", type: .object(Destination.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(order: Int, destination: Destination? = nil) {
                self.init(unsafeResultMap: ["__typename": "QuoteDayDestination", "order": order, "destination": destination.flatMap { (value: Destination) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var order: Int {
                get {
                  return resultMap["order"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "order")
                }
              }

              /// Reads a single `Destination` that is related to this `QuoteDayDestination`.
              public var destination: Destination? {
                get {
                  return (resultMap["destination"] as? ResultMap).flatMap { Destination(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "destination")
                }
              }

              public struct Destination: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Destination"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: String, name: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Destination", "id": id, "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: String {
                  get {
                    return resultMap["id"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String? {
                  get {
                    return resultMap["name"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }
          }
        }
      }

      public struct Accommodation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["QuoteAccommodationDetailsConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.object(Node.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]) {
          self.init(unsafeResultMap: ["__typename": "QuoteAccommodationDetailsConnection", "nodes": nodes.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of `QuoteAccommodationDetail` objects.
        public var nodes: [Node?] {
          get {
            return (resultMap["nodes"] as! [ResultMap?]).map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["QuoteAccommodationDetail"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("order", type: .nonNull(.scalar(Int.self))),
              GraphQLField("basis", type: .scalar(String.self)),
              GraphQLField("confirmation", type: .scalar(String.self)),
              GraphQLField("beverageInclusions", type: .list(.scalar(String.self))),
              GraphQLField("foodInclusions", type: .list(.scalar(String.self))),
              GraphQLField("roomType", type: .scalar(String.self)),
              GraphQLField("property", type: .object(Property.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, order: Int, basis: String? = nil, confirmation: String? = nil, beverageInclusions: [String?]? = nil, foodInclusions: [String?]? = nil, roomType: String? = nil, property: Property? = nil) {
            self.init(unsafeResultMap: ["__typename": "QuoteAccommodationDetail", "id": id, "order": order, "basis": basis, "confirmation": confirmation, "beverageInclusions": beverageInclusions, "foodInclusions": foodInclusions, "roomType": roomType, "property": property.flatMap { (value: Property) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var order: Int {
            get {
              return resultMap["order"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "order")
            }
          }

          public var basis: String? {
            get {
              return resultMap["basis"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "basis")
            }
          }

          public var confirmation: String? {
            get {
              return resultMap["confirmation"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "confirmation")
            }
          }

          public var beverageInclusions: [String?]? {
            get {
              return resultMap["beverageInclusions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "beverageInclusions")
            }
          }

          public var foodInclusions: [String?]? {
            get {
              return resultMap["foodInclusions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "foodInclusions")
            }
          }

          public var roomType: String? {
            get {
              return resultMap["roomType"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "roomType")
            }
          }

          /// Reads a single `Property` that is related to this `QuoteAccommodationDetail`.
          public var property: Property? {
            get {
              return (resultMap["property"] as? ResultMap).flatMap { Property(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "property")
            }
          }

          public struct Property: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Property"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("summary", type: .scalar(String.self)),
                GraphQLField("city", type: .scalar(String.self)),
                GraphQLField("country", type: .object(Country.selections)),
                GraphQLField("latitude", type: .scalar(Double.self)),
                GraphQLField("longitude", type: .scalar(Double.self)),
                GraphQLField("heroMedia", type: .object(HeroMedium.selections)),
                GraphQLField("gallery", type: .object(Gallery.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, name: String? = nil, summary: String? = nil, city: String? = nil, country: Country? = nil, latitude: Double? = nil, longitude: Double? = nil, heroMedia: HeroMedium? = nil, gallery: Gallery? = nil) {
              self.init(unsafeResultMap: ["__typename": "Property", "id": id, "name": name, "summary": summary, "city": city, "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }, "latitude": latitude, "longitude": longitude, "heroMedia": heroMedia.flatMap { (value: HeroMedium) -> ResultMap in value.resultMap }, "gallery": gallery.flatMap { (value: Gallery) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var summary: String? {
              get {
                return resultMap["summary"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "summary")
              }
            }

            public var city: String? {
              get {
                return resultMap["city"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "city")
              }
            }

            /// Reads a single `Country` that is related to this `Property`.
            public var country: Country? {
              get {
                return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "country")
              }
            }

            public var latitude: Double? {
              get {
                return resultMap["latitude"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "latitude")
              }
            }

            public var longitude: Double? {
              get {
                return resultMap["longitude"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "longitude")
              }
            }

            /// Reads a single `MediaItem` that is related to this `Property`.
            public var heroMedia: HeroMedium? {
              get {
                return (resultMap["heroMedia"] as? ResultMap).flatMap { HeroMedium(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "heroMedia")
              }
            }

            /// Reads a single `MediaGallery` that is related to this `Property`.
            public var gallery: Gallery? {
              get {
                return (resultMap["gallery"] as? ResultMap).flatMap { Gallery(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "gallery")
              }
            }

            public struct Country: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Country"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String, name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Country", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String {
                get {
                  return resultMap["id"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct HeroMedium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaItem"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("hash", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(hash: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaItem", "hash": hash])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var hash: String? {
                get {
                  return resultMap["hash"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "hash")
                }
              }
            }

            public struct Gallery: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaGallery"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("mediaGalleryItems", type: .nonNull(.object(MediaGalleryItem.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(mediaGalleryItems: MediaGalleryItem) {
                self.init(unsafeResultMap: ["__typename": "MediaGallery", "mediaGalleryItems": mediaGalleryItems.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Reads and enables pagination through a set of `MediaGalleryItem`.
              public var mediaGalleryItems: MediaGalleryItem {
                get {
                  return MediaGalleryItem(unsafeResultMap: resultMap["mediaGalleryItems"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "mediaGalleryItems")
                }
              }

              public struct MediaGalleryItem: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MediaGalleryItemsConnection"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("nodes", type: .nonNull(.list(.object(Node.selections)))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(nodes: [Node?]) {
                  self.init(unsafeResultMap: ["__typename": "MediaGalleryItemsConnection", "nodes": nodes.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A list of `MediaGalleryItem` objects.
                public var nodes: [Node?] {
                  get {
                    return (resultMap["nodes"] as! [ResultMap?]).map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } }
                  }
                  set {
                    resultMap.updateValue(newValue.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } }, forKey: "nodes")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["MediaGalleryItem"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("mediaItem", type: .object(MediaItem.selections)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(mediaItem: MediaItem? = nil) {
                    self.init(unsafeResultMap: ["__typename": "MediaGalleryItem", "mediaItem": mediaItem.flatMap { (value: MediaItem) -> ResultMap in value.resultMap }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Reads a single `MediaItem` that is related to this `MediaGalleryItem`.
                  public var mediaItem: MediaItem? {
                    get {
                      return (resultMap["mediaItem"] as? ResultMap).flatMap { MediaItem(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "mediaItem")
                    }
                  }

                  public struct MediaItem: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["MediaItem"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("hash", type: .scalar(String.self)),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(hash: String? = nil) {
                      self.init(unsafeResultMap: ["__typename": "MediaItem", "hash": hash])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var hash: String? {
                      get {
                        return resultMap["hash"] as? String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "hash")
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class TrackQuoteViewMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation TrackQuoteView($key: String!, $viewType: String!) {
      trackQuoteView(input: {key: $key, viewType: $viewType}) {
        __typename
        success
      }
    }
    """

  public let operationName: String = "TrackQuoteView"

  public var key: String
  public var viewType: String

  public init(key: String, viewType: String) {
    self.key = key
    self.viewType = viewType
  }

  public var variables: GraphQLMap? {
    return ["key": key, "viewType": viewType]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("trackQuoteView", arguments: ["input": ["key": GraphQLVariable("key"), "viewType": GraphQLVariable("viewType")]], type: .object(TrackQuoteView.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(trackQuoteView: TrackQuoteView? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "trackQuoteView": trackQuoteView.flatMap { (value: TrackQuoteView) -> ResultMap in value.resultMap }])
    }

    public var trackQuoteView: TrackQuoteView? {
      get {
        return (resultMap["trackQuoteView"] as? ResultMap).flatMap { TrackQuoteView(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "trackQuoteView")
      }
    }

    public struct TrackQuoteView: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GenericResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(success: Bool) {
        self.init(unsafeResultMap: ["__typename": "GenericResponse", "success": success])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}
