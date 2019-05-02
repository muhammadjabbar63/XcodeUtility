//
//  DoubleExtention.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit
import CoreFoundation

  extension Double {
    /// Rounds the double to decimal places value
    
    func getDisplayString() -> String {
        return self > Double(Int(self)) ? "\(self.roundTo(places: 2))" : "\(Int(self))"
    }
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    func localize(style: NumberFormatter.Style = .none, decimalPlaces : Int = 2 , miniIntegers: Int? = nil, miniDecimalPlaces : Int? = nil, groupingSeparator : String? = nil) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = groupingSeparator
        formatter.maximumFractionDigits = decimalPlaces
        if miniIntegers != nil {
            formatter.minimumIntegerDigits = miniIntegers!
        }
        if miniDecimalPlaces != nil {
            formatter.minimumFractionDigits = miniDecimalPlaces!
        }

        let result = formatter.string(from: NSNumber(value: self))
        return result ?? "\(self)"
    }
}
 extension Int {
    func localize(style: NumberFormatter.Style = .none, miniIntegers: Int? = nil, groupingSeparator : String? = nil) -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = groupingSeparator
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        if miniIntegers != nil {
            formatter.minimumIntegerDigits = miniIntegers!
        }
        let result = formatter.string(from: NSNumber(value: self))
        return result ?? "\(self)"
    }
}
 extension Float {
    /// Rounds the double to decimal places value
    func localize(style: NumberFormatter.Style = .none, decimalPlaces : Int = 2, miniIntegers: Int? = nil, miniDecimalPlaces : Int? = nil, groupingSeparator : String? = nil) -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = groupingSeparator
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        if miniIntegers != nil {
            formatter.minimumIntegerDigits = miniIntegers!
        }
        if miniDecimalPlaces != nil {
            formatter.minimumFractionDigits = miniDecimalPlaces!
        }
        formatter.maximumFractionDigits = decimalPlaces
        let result = formatter.string(from: NSNumber(value: self))
        return result ?? "\(self)"
    }
    
}
 extension Int64 {
    func localize(style: NumberFormatter.Style = .none, miniIntegers: Int? = nil, groupingSeparator : String? = nil) -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = groupingSeparator
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        if miniIntegers != nil {
            formatter.minimumIntegerDigits = miniIntegers!
        }
        let result = formatter.string(from: NSNumber(value: self))
        return result ?? "\(self)"
    }
}

