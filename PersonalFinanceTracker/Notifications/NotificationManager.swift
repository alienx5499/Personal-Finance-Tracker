//
//  NotificationManager.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

import UserNotifications
import SwiftUI

class NotificationManager {
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Request authorization error: \(error)")
            } else if granted {
                // Schedule daily tip or any other local notifications
                self.scheduleDailyTipNotification()
            }
        }
    }
    
    func scheduleDailyTipNotification() {
        let dailyTips = [
            FinancialTip(message: "Track every expense. Little costs add up!"),
            FinancialTip(message: "Save a fixed percentage of your allowance each week."),
            FinancialTip(message: "Look for student discounts on software and supplies."),
            FinancialTip(message: "Avoid impulse buys. Wait 24 hours before purchasing."),
            FinancialTip(message: "Plan your meals to avoid overspending on food.")
        ]
        
        let randomTip = dailyTips.randomElement()?.message ?? "Keep tracking your expenses!"
        
        let content = UNMutableNotificationContent()
        content.title = "Daily Financial Tip"
        content.body = randomTip
        content.sound = .default
        
        // Schedule at 9 AM daily
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "DailyTipNotification",
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Scheduling notification error: \(error)")
            }
        }
    }
}
