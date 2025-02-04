//
//  PersonalFinanceTrackerApp.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

@main
struct PersonalFinanceTrackerApp: App {
    // You likely already have these or something similar
    @StateObject private var transactionVM = TransactionViewModel()
    @StateObject private var savingsGoalVM = SavingsGoalViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionVM)
                .environmentObject(savingsGoalVM)
        }
    }
}
