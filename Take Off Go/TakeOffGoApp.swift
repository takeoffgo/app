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

    public func application(_ application: UIApplication,
                            continue userActivity: NSUserActivity,
                            restorationHandler: @escaping ([Any]?) -> Void) -> Bool
    {
        return true
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                TripListView()
            }
        }
    }
}
