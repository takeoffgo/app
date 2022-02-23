import SwiftUI

struct TripDetailView: View {
    @ObservedObject var trip: TripViewModel

    var body: some View {
        content()
            .navigationTitle(trip.quote == nil ? "Loading..." : trip.quote!.hero?.title ?? "")
    }

    func content() -> AnyView {
        if trip.loading {
            return AnyView(VStack(spacing: 8) {
                ProgressView()
                Text("Loading trip \(trip.id)")
            })
        } else if trip.error {
            return AnyView(Label("An error occurred loading trip \(trip.id)", systemImage: "exclamationmark"))
        } else {
            let quote = Quote(source: trip.quote!)
            return AnyView(TabView {
                ScrollView {
                    VStack(alignment: .leading) {
                        if !quote.heroImage.isEmpty {
                            Image.fromHash(hash: quote.heroImage)
                                .resizable()
                                .aspectRatio(16 / 9, contentMode: .fill)
                        }

                        VStack(alignment: .leading) {
                            if !quote.title.isEmpty {
                                Text(quote.title)
                                    .font(.headline)
                            }

                            Text(quote.caption)
                                .font(.caption)

                            if !quote.subtitle.isEmpty {
                                MarkdownView(source: quote.subtitle)
                                    .padding(.top, 1)
                            }

                        }.padding()
                    }
                }.tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Overview")
                }
                TripOverviewView(quote: trip.quote!).tabItem {
                    Image(systemName: "calendar")
                    Text("Itinerary")
                }
                TripAccommodationView(quote: trip.quote!).tabItem {
                    Image(systemName: "house")
                    Text("Accommodation")
                }
                TripFlightsView(quote: trip.quote!).tabItem {
                    Image(systemName: "airplane.departure")
                    Text("Flights")
                }
            })
        }
    }
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailView(trip: SampleData.Trips.loading)
            .previewDisplayName("Loading")

        TripDetailView(trip: SampleData.Trips.error)
            .previewDisplayName("Errored")

        TripDetailView(trip: SampleData.Trips.success)
            .previewDisplayName("Success")
    }
}
