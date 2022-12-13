//
//  Extensions.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 12/13/22.
//

import Foundation
import SwiftUI
import MapKit

//MARK: - VIEW

#if canImport(UIKit)
extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//MARK: - STRING LOCALIZATION

extension String {
    
    func localized() -> String {
        NSLocalizedString(self, comment: self)
    }
}
