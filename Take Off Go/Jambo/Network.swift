import Apollo
import Foundation

class Network {
    static let shared = Network()
    
    func createClient() -> ApolloClient {
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("jambo_apollo_db.sqlite")
        
        // 2. Use that file URL to instantiate the SQLite cache:
        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)
        
        // 3. And then instantiate an instance of `ApolloStore` with the cache you've just created:
        let store = ApolloStore(cache: sqliteCache)
        
        // 4. Assuming you've set up your `networkTransport` instance elsewhere,
        // pass the store you just created into your `ApolloClient` initializer,
        // and you're now set up to use the SQLite cache for persistent storage
        
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: store), endpointURL: URL(string: "https://api.takeoffgo.com/jambo/graphql")!)
        
        return ApolloClient(networkTransport: networkTransport, store: store)
    }
    
    private(set) lazy var apollo = createClient()
}
