//
//  SavingGoalListView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//


import SwiftUI

struct SavingGoalListView: View {
    @EnvironmentObject var savingsGoalVM: SavingsGoalViewModel
    @State private var showAddGoalSheet = false
    
    // New properties to handle updating the current amount
    @State private var goalToUpdate: SavingGoal?
    @State private var showUpdateSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(savingsGoalVM.savingGoals, id: \.self) { goal in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(goal.title ?? "Untitled Goal")
                                .font(.headline)
                            HStack {
                                Text("Saved: \(String(format: "%.2f", goal.currentAmount)) / \(String(format: "%.2f", goal.targetAmount))")
                                if let deadline = goal.deadline {
                                    Spacer()
                                    Text(deadline, style: .date)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .font(.subheadline)
                        }
                        Spacer()
                        
                        // Button to open a sheet that updates currentAmount
                        Button("Add Funds") {
                            goalToUpdate = goal
                            showUpdateSheet = true
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .onDelete(perform: deleteGoal)
            }
            .navigationTitle("Savings Goals")
            .toolbar {
                Button(action: {
                    showAddGoalSheet.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        // Sheet for adding a new goal
        .sheet(isPresented: $showAddGoalSheet) {
            AddSavingGoalView(isPresented: $showAddGoalSheet)
                .environmentObject(savingsGoalVM)
        }
        // Sheet for updating current amount
        .sheet(isPresented: $showUpdateSheet) {
            if let goalToUpdate = goalToUpdate {
                UpdateSavingAmountView(
                    goal: goalToUpdate,
                    isPresented: $showUpdateSheet
                )
                .environmentObject(savingsGoalVM)
            }
        }
    }
    
    private func deleteGoal(offsets: IndexSet) {
        offsets.map { savingsGoalVM.savingGoals[$0] }.forEach { goal in
            savingsGoalVM.deleteSavingGoal(goal)
        }
    }
}
