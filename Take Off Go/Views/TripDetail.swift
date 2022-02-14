import SwiftUI

struct TripDetail: View {
    var quote: GetQuoteQuery.Data.Quote

    var body: some View {
        ScrollView {
            VStack {
                if quote.hero?.image?.hash != nil {
                    FullWidthImage(hash: quote.hero!.image!.hash!)
                }

                VStack(alignment: .leading) {
                    if !(quote.hero?.subtitle?.isEmpty ?? true) {
                        Text(quote.hero!.subtitle!).font(.subheadline)
                            .padding(.bottom, 5)
                    }
                    Text("Starts \(quote.startDate?.string(dateStyle: .full) ?? "soon?") for \(String(quote.duration!)) days")
                        .font(.caption)
                        .padding(.bottom, 20)

                    HStack {
                        NavigationLink(destination: TripOverviewView(quote: self.quote)) {
                            SectionButton(label: "Overview", icon: "info")
                        }
                        .frame(maxWidth: .infinity)

                        NavigationLink(destination: Text("days")) {
                            SectionButton(label: "Daily breakdown", icon: "calendar-days")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .fixedSize(horizontal: false, vertical: true)

                    HStack {
                        NavigationLink(destination: Text("accommodation")) {
                            SectionButton(label: "Accommodation", icon: "hotel")
                        }
                        .frame(maxWidth: .infinity)

                        NavigationLink(destination: Text("flights")) {
                            SectionButton(label: "Flights", icon: "plane-departure")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                }.padding()
            }
        }
        .navigationTitle(quote.hero?.title ?? "")
    }
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetail(
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
