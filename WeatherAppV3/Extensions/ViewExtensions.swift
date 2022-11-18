//
//  ViewExtensions.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/13/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
}
