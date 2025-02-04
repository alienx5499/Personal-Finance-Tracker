//
//  SettingsView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var enableTips: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Categories")) {
                    // Show default categories
                    ForEach(CategoryModel.defaultCategories) { category in
                        HStack {
                            Image(systemName: category.iconName)
                            Text(category.name)
                                .foregroundColor(category.color)
                        }
                    }
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Enable Daily Tips", isOn: $enableTips)
                }
            }
            .navigationTitle("Settings")
        }
    }
}
