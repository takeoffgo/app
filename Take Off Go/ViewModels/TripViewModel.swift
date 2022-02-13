import Apollo
import Foundation

class TripViewModel: Identifiable, ObservableObject {
    var id: String

    @Published var quote: GetQuoteQuery.Data.Quote? = nil
    @Published var loading = true
    @Published var error = false

    init(id: String) {
        self.id = id

        load()
    }

    init(id: String, quote: GetQuoteQuery.Data.Quote? = nil, loading: Bool = true, error: Bool = false) {
        self.id = id
        self.quote = quote
        self.loading = loading
        self.error = error
    }

    private func load(cachePolicy: CachePolicy = .default) {
        loading = true

        Network.shared.apollo.fetch(query: GetQuoteQuery(key: id), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let graphQLResult):
                self.quote = graphQLResult.data?.quote

                self.error = self.quote == nil
            case .failure(let error):
                self.error = true
                print("Failure for \(self.id)! Result: \(error)")
            }
            self.loading = false
        }
    }

    func reload() {
        load(cachePolicy: .fetchIgnoringCacheData)
    }
}
