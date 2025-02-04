//
//  ContentView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    // Tracks whether we are currently showing onboarding
    @State private var showOnboarding: Bool = false
    
    var body: some View {
        Group {
            if showOnboarding {
                // Show onboarding until user finishes
                OnboardingView(showOnboarding: $showOnboarding)
            } else {
                // Show main app interface
                MainTabView()
            }
        }
        .onAppear {
            // Check if the user previously set a currency code
            let storedCurrency = UserDefaults.standard.string(forKey: "preferredCurrencyCode")
            // If no preference found, show onboarding
            if storedCurrency == nil {
                showOnboarding = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
