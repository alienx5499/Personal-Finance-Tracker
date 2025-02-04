//
//  MainTabView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TransactionListView()
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
            
            SavingGoalListView()
                .tabItem {
                    Label("Savings", systemImage: "wallet.pass.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
