//
//  SavingGoal+CoreDataProperties.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import Foundation
import CoreData

extension SavingGoal {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavingGoal> {
        return NSFetchRequest<SavingGoal>(entityName: "SavingGoal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var targetAmount: Double
    @NSManaged public var currentAmount: Double
    @NSManaged public var deadline: Date?
}

// MARK: - Generated accessors
extension SavingGoal : Identifiable {

}
