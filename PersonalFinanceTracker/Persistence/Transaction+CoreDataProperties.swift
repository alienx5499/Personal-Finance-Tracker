//
//  Transaction+CoreDataProperties.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import Foundation
import CoreData

extension Transaction {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var amount: Double
    @NSManaged public var category: String?
    @NSManaged public var notes: String?
}

// MARK: - Generated accessors
extension Transaction : Identifiable {

}
