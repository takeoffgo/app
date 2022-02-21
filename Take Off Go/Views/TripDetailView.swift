import SwiftUI

struct TripDetailView: View {
    @ObservedObject var trip: TripViewModel

    var body: some View {
        content()
            .navigationTitle(trip.quote == nil ? "Loading..." : trip.quote!.hero?.title ?? "")
    }

    func content() -> AnyView {
        if trip.loading {
            return AnyView(HStack {
                ProgressView()
                Text("Loading trip \(trip.id)")
            })
        } else if trip.error {
            return AnyView(Label("An error occurred loading trip \(trip.id)", systemImage: "exclamationmark"))
        } else {
            return AnyView(TabView {
                ScrollView {
                    VStack {
                        if trip.quote!.hero?.image?.hash != nil {
                            Image.fromHash(hash: trip.quote!.hero!.image!.hash!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }

                        VStack(alignment: .leading) {
                            if !(trip.quote!.hero?.subtitle?.isEmpty ?? true) {
                                Text(trip.quote!.hero!.subtitle!).font(.subheadline)
                                    .padding(.bottom, 5)
                            }
                            Text("Starts \(trip.quote!.startDate?.string(dateStyle: .full) ?? "soon?") for \(String(trip.quote!.duration!)) days")
                                .font(.caption)
                                .padding(.bottom, 20)

                            Spacer()
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
