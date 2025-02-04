//
//  TransactionDetailView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    
    var body: some View {
        Form {
            Section(header: Text("Transaction Details")) {
                Text("Amount: \(String(format: "$%.2f", transaction.amount))")
                Text("Category: \(transaction.category ?? "Unknown")")
                if let date = transaction.date {
                    Text("Date: \(date, style: .date)")
                }
                if let notes = transaction.notes, !notes.isEmpty {
                    Text("Notes: \(notes)")
                }
            }
        }
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}
