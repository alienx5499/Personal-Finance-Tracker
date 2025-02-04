//
//  CategoryModel.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

//
//  CategoryModel.swift
//  PersonalFinanceTracker
//

import SwiftUI

/// Represents a single category for expenses.
struct FinanceCategory: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let iconName: String
    let color: Color
}

/// An array of default categories. You can expand or customize.
struct CategoryModel {
    static let defaultCategories: [FinanceCategory] = [
        FinanceCategory(name: "Food", iconName: "fork.knife", color: .orange),
        FinanceCategory(name: "Transport", iconName: "car.fill", color: .blue),
        FinanceCategory(name: "Study Materials", iconName: "book.closed.fill", color: .purple),
        FinanceCategory(name: "Entertainment", iconName: "gamecontroller.fill", color: .green),
        FinanceCategory(name: "Others", iconName: "ellipsis.circle.fill", color: .gray)
    ]
}
