//
//  SavingsGoalViewModel.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import Foundation
import CoreData
import SwiftUI

class SavingsGoalViewModel: ObservableObject {
    @Published var savingGoals: [SavingGoal] = []
    
    private let viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = context
        fetchSavingGoals()
    }
    
    func fetchSavingGoals() {
        let request: NSFetchRequest<SavingGoal> = SavingGoal.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \SavingGoal.title, ascending: true)]
        
        do {
            savingGoals = try viewContext.fetch(request)
        } catch {
            print("Error fetching saving goals: \(error)")
        }
    }
    
    func addSavingGoal(title: String, targetAmount: Double, deadline: Date?) {
        let goal = SavingGoal(context: viewContext)
        goal.id = UUID()
        goal.title = title
        goal.targetAmount = targetAmount
        goal.currentAmount = 0.0
        goal.deadline = deadline
        
        saveContext()
        fetchSavingGoals()
    }
    
    func updateCurrentAmount(goal: SavingGoal, newAmount: Double) {
        goal.currentAmount = newAmount
        saveContext()
        fetchSavingGoals()
    }
    
    func deleteSavingGoal(_ goal: SavingGoal) {
        viewContext.delete(goal)
        saveContext()
        fetchSavingGoals()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving saving goal: \(error)")
        }
    }
}
