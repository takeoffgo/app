import SwiftUI

struct TripDetailView: View {
    var quote: GetQuoteQuery.Data.Quote

    var body: some View {
        TabView {
            ScrollView {
                VStack {
                    if quote.hero?.image?.hash != nil {
                        Image.fromHash(hash: quote.hero!.image!.hash!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }

                    VStack(alignment: .leading) {
                        if !(quote.hero?.subtitle?.isEmpty ?? true) {
                            Text(quote.hero!.subtitle!).font(.subheadline)
                                .padding(.bottom, 5)
                        }
                        Text("Starts \(quote.startDate?.string(dateStyle: .full) ?? "soon?") for \(String(quote.duration!)) days")
                            .font(.caption)
                            .padding(.bottom, 20)

                        Spacer()
                    }.padding()
                }
            }.tabItem {
                Image(systemName: "info.circle.fill")
                Text("Overview")
            }
            TripOverviewView(quote: quote).tabItem {
                Image(systemName: "calendar")
                Text("Itinerary")
            }
            TripAccommodationView(quote: quote).tabItem {
                Image(systemName: "house")
                Text("Accommodation")
            }
            TripFlightsView(quote: quote).tabItem {
                Image(systemName: "airplane.departure")
                Text("Flights")
            }
        }
        .navigationTitle(quote.hero?.title ?? "")
    }
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailView(
            quote: SampleData.quote)
    }
}

struct SectionButton: View {
    var label: String
    var icon: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.bar)
            VStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 32)
                Text(label)
                    .foregroundColor(.black)

            }.padding()
        }
    }
}
