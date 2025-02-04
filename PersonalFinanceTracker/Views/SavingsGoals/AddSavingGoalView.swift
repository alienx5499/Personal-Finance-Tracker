//
//  AddSavingGoalView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct AddSavingGoalView: View {
    @EnvironmentObject var savingsGoalVM: SavingsGoalViewModel
    @Binding var isPresented: Bool
    
    @State private var title: String = ""
    @State private var targetAmount: String = ""
    @State private var deadline = Date()
    @State private var hasDeadline = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Goal Details")) {
                    TextField("Title", text: $title)
                    TextField("Target Amount", text: $targetAmount)
                        .keyboardType(.decimalPad)
                    
                    Toggle("Set a deadline?", isOn: $hasDeadline.animation())
                    if hasDeadline {
                        DatePicker("Deadline", selection: $deadline, displayedComponents: .date)
                    }
                }
            }
            .navigationBarTitle("Add Saving Goal", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    saveGoal()
                }
            )
        }
    }
    
    private func saveGoal() {
        guard let target = Double(targetAmount), !title.isEmpty else {
            // Show an alert or handle invalid input
            return
        }
        let goalDeadline = hasDeadline ? deadline : nil
        savingsGoalVM.addSavingGoal(
            title: title,
            targetAmount: target,
            deadline: goalDeadline
        )
        isPresented = false
    }
}
