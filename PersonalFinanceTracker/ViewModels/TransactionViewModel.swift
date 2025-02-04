//
//  TransactionViewModel.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//


import Foundation
import CoreData
import SwiftUI

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private let viewContext: NSManagedObjectContext
    
    // For convenience, we use the shared container.
    // In your real code, you could inject the context from the App struct.
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = context
        fetchTransactions()
    }
    
    func fetchTransactions() {
        let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        // Sort by date descending
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Transaction.date, ascending: false)]
        
        do {
            transactions = try viewContext.fetch(request)
        } catch {
            print("Error fetching transactions: \(error)")
        }
    }
    
    func addTransaction(amount: Double, date: Date, category: String, notes: String?) {
        let newTransaction = Transaction(context: viewContext)
        newTransaction.id = UUID()
        newTransaction.amount = amount
        newTransaction.date = date
        newTransaction.category = category
        newTransaction.notes = notes
        
        saveContext()
        fetchTransactions()
    }
    
    func deleteTransaction(_ transaction: Transaction) {
        viewContext.delete(transaction)
        saveContext()
        fetchTransactions()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving transaction: \(error)")
        }
    }
}
