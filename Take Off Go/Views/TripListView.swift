import SwiftUI

struct TripListView: View {
    @ObservedObject var model = TripListViewModel()

    @State var importTripKey = ""

    @State var isAdding = false
    @State var activeKey = ""

    var body: some View {
        content()
            .navigationTitle("My trips")
            .toolbar {
                Button(action: { isAdding = true }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Import trip")
            }
            .sheet(isPresented: $isAdding) {
                NavigationView {
                    ImportTripView(importTripKey: $importTripKey)
                        .navigationTitle("Import trip")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isAdding = false
                                    importTripKey = ""
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Import") {
                                    model.addTrip(key: importTripKey)
                                    activeKey = importTripKey
                                    isAdding = false
                                    importTripKey = ""
                                }
                                .disabled(importTripKey.isEmpty)
                            }
                        }
                }
            }
            .refreshable {
                model.refresh()
            }
            .onOpenURL { url in
                if url.pathComponents.count == 3 && url.pathComponents[1] == "itinerary" {
                    let key = url.pathComponents[2]

                    model.addTrip(key: key)
                    activeKey = key
                }
            }
    }

    func content() -> AnyView {
        if model.trips.isEmpty {
            return AnyView(Text("Looks like you don't have any trips loaded.\n\nTalk to your travel consultant for help adding one.")
                .fixedSize(horizontal: false, vertical: false)
                .multilineTextAlignment(.center)
                .padding()
            )
        }
        else {
            return AnyView(VStack {
                if !activeKey.isEmpty {
                    NavigationLink("Hidden link", isActive: .constant(true)) {
                        TripDetailView(trip: model.trips.first(where: { $0.id == activeKey })!)
                            .onDisappear(perform: { activeKey = "" })
                    }.hidden()
                }
                List {
                    ForEach(model.trips) { trip in
                        TripListRowView(trip: trip)
                    }
                    .onDelete { indicies in
                        withAnimation {
                            model.removeAt(indicies: indicies)
                        }
                    }
                }
            })
        }
    }
}

struct TripList_Previews: PreviewProvider {
    static var previews: some View {
        TripListView(model: TripListViewModel(trips: [
            TripViewModel(id: "ABC123 (error)", loading: false, error: true),
            TripViewModel(id: "ABC124 (loading)", loading: true),
            TripViewModel(id: "ABC125 (success)", quote: SampleData.quote, loading: false),
        ]))
        .previewDisplayName("Has trips")

        TripListView(model: TripListViewModel(trips: [
        ]))
        .previewDisplayName("No trips")
    }
}
