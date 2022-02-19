import SwiftUI

struct TripListView: View {
    @ObservedObject var model = TripListViewModel()

    @State var importTripKey = ""

    @State var isAdding = false

    var body: some View {
        List {
            ForEach(model.trips) { trip in
                TripListRowView(trip: trip)
            }
            .onDelete { indicies in
                model.removeAt(indicies: indicies)
            }
        }
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
    }
}

struct TripList_Previews: PreviewProvider {
    static var previews: some View {
        TripListView(model: TripListViewModel(trips: [
            TripViewModel(id: "ABC123 (error)", loading: false, error: true),
            TripViewModel(id: "ABC124 (loading)", loading: true),
            TripViewModel(id: "ABC125 (success)", quote: SampleData.quote, loading: false),
        ]))
    }
}
