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

                if !self.error {
                    Task {
                        do {
                            try await self.fetchImages()
                            DispatchQueue.main.async {
                                self.loading = false
                            }
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    self.loading = false
                }

            case .failure(let error):
                self.error = true
                self.loading = false
                print("Failure for \(self.id)! Result: \(error)")
            }
        }
    }

    private func fetchImages() async throws {
        var hashes: [String] = []
        hashes.append(contentsOf: quote?.accommodation.nodes
            .map { $0?.property?.heroMedia?.hash }
            .filter { $0 != nil }
            .map { $0! }
            ?? [])
        hashes.append(contentsOf: quote?.accommodation.nodes
            .map { $0?.property?.gallery?.mediaGalleryItems.nodes.map { $0?.mediaItem?.hash } ?? [] }
            .reduce([], +)
            .filter { $0 != nil }
            .map { $0! }
            ?? [])

        if quote?.hero?.image?.hash != nil {
            hashes.append(quote!.hero!.image!.hash!)
        }

        let folder = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("com.takeoffgo.app")

        try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true, attributes: nil)

        for hash in hashes {
            let url = URL(string: "https://cdn.takeoffgo.com/\(hash)?w=1600&h=900")!
            let destination = folder.appendingPathComponent(hash)

            if !FileManager.default.fileExists(atPath: destination.path) {
                print("**** downloading \(url): \(destination)")

                let (source, _) = try await URLSession.shared.download(from: url)
                try FileManager.default.moveItem(at: source, to: destination)
            } else {
                print("**** skipping \(url): \(destination)")
            }
        }
    }

    func reload() {
        load(cachePolicy: .fetchIgnoringCacheData)
    }
}
