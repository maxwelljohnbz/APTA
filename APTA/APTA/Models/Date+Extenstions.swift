//
//  Date+Extenstions.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

extension Date {
    // Gives the current week dates
    static var currentWeek: [Date] {
        let calendar = Calendar.current
        guard let firstWeekDay = calendar.dateInterval(of: .weekOfMonth, for: .now)?.start else {
            return []
        }
        
        var week: [Date] = []
        for index in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: index, to: firstWeekDay) {
                week.append(day)
            }
        }
        
        return week
    }
    
    // Convert date to string
    func string(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    //Check if dates are the same
    func isSame(_ date: Date?) -> Bool {
        guard let date else { return false }
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
}
