//
//  OnboardingView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct OnboardingView: View {
    // A binding to determine whether we should continue showing this onboarding screen
    @Binding var showOnboarding: Bool
    
    // The user's selected currency code, e.g., "USD", "EUR", "GBP"
    @State private var selectedCurrencyCode: String = "USD"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Personal Finance Tracker")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Select Your Currency")
                .font(.headline)
            
            Picker("Currency", selection: $selectedCurrencyCode) {
                Text("USD").tag("USD")
                Text("EUR").tag("EUR")
                Text("GBP").tag("GBP")
                Text("INR").tag("INR")
                // Add as many currency codes as you like
            }
            .pickerStyle(.wheel)
            .frame(height: 150)
            
            Button("Continue") {
                // Save the user’s currency choice
                UserDefaults.standard.set(selectedCurrencyCode, forKey: "preferredCurrencyCode")
                
                // Hide the onboarding view
                showOnboarding = false
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        // Example preview usage
        OnboardingView(showOnboarding: .constant(true))
    }
}
