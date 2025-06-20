//
//  Untitled.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import Foundation

enum MealType: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"

    var id: String { self.rawValue }
}
