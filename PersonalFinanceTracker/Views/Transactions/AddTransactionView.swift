//
//  AddTransactionView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    @Binding var isPresented: Bool
    
    // MARK: - Form State
    @State private var amount: String = ""
    @State private var selectedCategory: FinanceCategory = CategoryModel.defaultCategories[0]
    @State private var notes: String = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    // Amount
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    // Date
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    // Category Picker
                    categoryPicker
                    
                    // Notes
                    TextField("Notes", text: $notes)
                }
            }
            .navigationBarTitle("Add Transaction", displayMode: .inline)
            .navigationBarItems(
                leading: cancelButton,
                trailing: saveButton
            )
        }
    }
}

// MARK: - Subviews & Actions
extension AddTransactionView {
    
    /// A separate view for the category picker to simplify the body.
    private var categoryPicker: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(CategoryModel.defaultCategories) { category in
                CategoryPickerRow(category: category)
                    // `.tag(category)` is needed for SwiftUI to identify the selection (FinanceCategory must be Hashable).
                    .tag(category)
            }
        }
    }
    
    /// Leading navigation bar button to cancel.
    private var cancelButton: some View {
        Button("Cancel") {
            isPresented = false
        }
    }
    
    /// Trailing navigation bar button to save the transaction.
    private var saveButton: some View {
        Button("Save") {
            handleSave()
        }
    }
    
    /// The logic to convert the amount string and add the transaction.
    private func handleSave() {
        // Attempt to parse the amount string
        guard let amountValue = Double(amount) else {
            // Ideally show an alert or user feedback if parsing fails
            return
        }
        // Add transaction via the ViewModel
        transactionVM.addTransaction(
            amount: amountValue,
            date: date,
            category: selectedCategory.name,
            notes: notes
        )
        // Dismiss the sheet
        isPresented = false
    }
}

// MARK: - CATEGORY PICKER ROW
struct CategoryPickerRow: View {
    let category: FinanceCategory
    
    var body: some View {
        HStack {
            Image(systemName: category.iconName)
            Text(category.name)
        }
    }
}
