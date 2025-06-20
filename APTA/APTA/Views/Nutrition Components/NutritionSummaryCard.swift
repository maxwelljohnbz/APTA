//
//  NutritionSummaryCard.swift
//  APTA
//
//  Created by Maxwell  on 6/19/25.
//

import SwiftUI

struct NutritionSummaryCard: View {
    let calories: Int
    let calorieGoal: Int

    var body: some View {
        VStack(spacing: 12) {
            // Title at top, centered
            HStack(spacing: 6) {
                Image(systemName: "bolt")
                Text("Daily Intake")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .center)

            // Calorie Ring centered
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 8)
                    .frame(width: 100, height: 100)

                Circle()
                    .trim(from: 0, to: min(CGFloat(calories) / CGFloat(calorieGoal), 1.0))
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 100, height: 100)

                VStack(spacing: 4) {
                    Text("Calories")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(calories)")
                        .font(.headline)
                    Text("kcal/day")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .frame(width: 215, height: 220)
        .background(Color(.systemGray6))
        .cornerRadius(24)
    }
}



#Preview {
    NutritionSummaryCard(calories: 1500, calorieGoal: 2000)
}
