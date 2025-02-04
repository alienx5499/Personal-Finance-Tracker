//
//  UpdateSavingAmountView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct UpdateSavingAmountView: View {
    @EnvironmentObject var savingsGoalVM: SavingsGoalViewModel
    
    let goal: SavingGoal
    @Binding var isPresented: Bool
    
    // Text field to type the new current amount
    @State private var updatedAmount: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Update Saved Amount")) {
                    TextField("Current Amount", text: $updatedAmount)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Add Funds", displayMode: .inline)
            .navigationBarItems(
                leading: cancelButton,
                trailing: updateButton
            )
        }
        .onAppear {
            // Pre-fill the field with the existing currentAmount
            updatedAmount = String(format: "%.2f", goal.currentAmount)
        }
    }
}

extension UpdateSavingAmountView {
    private var cancelButton: some View {
        Button("Cancel") {
            isPresented = false
        }
    }
    
    private var updateButton: some View {
        Button("Update") {
            guard let amount = Double(updatedAmount) else {
                // Show alert in real app if desired
                return
            }
            // Update the existing goal in Core Data
            savingsGoalVM.updateCurrentAmount(goal: goal, newAmount: amount)
            isPresented = false
        }
    }
}
