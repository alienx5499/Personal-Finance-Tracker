//
//  CurrencyFormatter.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import Foundation

/// Provides a single helper function for converting a Double into a currency string.
struct CurrencyFormatter {
    static func formattedCurrency(_ amount: Double) -> String {
        // Retrieve user’s stored currency code or fallback
        let code = UserDefaults.standard.string(forKey: "preferredCurrencyCode")
                   ?? Locale.current.currencyCode
                   ?? "USD"
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // Use the device's locale for decimal grouping, etc.
        formatter.locale = Locale.current
        // Override the currency code to the user’s preference
        formatter.currencyCode = code
        
        guard let result = formatter.string(from: NSNumber(value: amount)) else {
            return String(format: "%.2f", amount)
        }
        return result
    }
}
