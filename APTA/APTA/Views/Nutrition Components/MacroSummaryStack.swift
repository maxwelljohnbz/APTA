//
//  MacroSummaryStack.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import SwiftUI

struct MacroSummaryStack: View {
    let protein: Int
    let carbs: Int
    let fats: Int
    
    var body: some View {
        VStack(spacing: 12) {
            MacroSummaryCard(title: "Protein", value: protein, color: .green)
            MacroSummaryCard(title: "Carbs", value: carbs, color: .orange)
            MacroSummaryCard(title: "Fats", value: fats, color: .blue)
        }
    }
}

#Preview {
    MacroSummaryStack(
        protein: 125,
        carbs: 220,
        fats: 45
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
