//
//  WeatherAppV3App.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/12/22.
//

import SwiftUI

@main
struct WeatherAppV3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Store())
        }
    }
}
