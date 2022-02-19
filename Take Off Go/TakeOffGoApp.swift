import SwiftUI

import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@main
struct TakeOffGoApp: App {
    init() {
        AppCenter.start(withAppSecret: "b59b5bc9-edbc-451c-af5a-ad731d211aa9", services: [
            Analytics.self,
            Crashes.self
        ])
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                TripListView()
            }
        }
    }
}
