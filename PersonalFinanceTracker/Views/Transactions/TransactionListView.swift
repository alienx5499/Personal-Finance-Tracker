//
//  TransactionListView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct TransactionListView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(transactionVM.transactions, id: \.self) { transaction in
                    NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                        TransactionRowView(transaction: transaction)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Transactions")
            .toolbar {
                Button(action: { showAddSheet.toggle() }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddTransactionView(isPresented: $showAddSheet)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        offsets.map { transactionVM.transactions[$0] }.forEach { transaction in
            transactionVM.deleteTransaction(transaction)
        }
    }
}

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            // Category icon if available
            if let catName = transaction.category,
               let categoryIcon = CategoryModel.defaultCategories.first(where: { $0.name == catName })?.iconName {
                Image(systemName: categoryIcon)
            } else {
                Image(systemName: "questionmark.circle")
            }
            
            VStack(alignment: .leading) {
                Text(transaction.category ?? "Unknown")
                    .font(.headline)
                if let notes = transaction.notes, !notes.isEmpty {
                    Text(notes)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            Text(String(format: "$%.2f", transaction.amount))
                .fontWeight(.bold)
        }
    }
}
