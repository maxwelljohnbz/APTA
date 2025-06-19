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
    let protein: Int
    let carbs: Int
    let fats: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 8) {
                Image(systemName: "bolt")
                Text("Daily Intake")
                    .font(.headline)
            }
            .padding(.leading)

            HStack {
                // Main Calorie Ring
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
                .padding(.leading)

                Spacer()

                // Macros
                VStack(alignment: .leading, spacing: 16) {
                    MacroRingView(title: "Protein", value: protein, color: .green)
                    MacroRingView(title: "Carbs", value: carbs, color: .orange)
                    MacroRingView(title: "Fats", value: fats, color: .blue)
                }
                .padding(.trailing)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(30)
    }
}

struct MacroRingView: View {
    let title: String
    let value: Int
    let color: Color

    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 5)
                    .frame(width: 28, height: 28)

                Circle()
                    .trim(from: 0, to: 0.7) // static fill for mockup
                    .stroke(color, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 28, height: 28)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)
                Text("\(value)g")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    NutritionSummaryCard(calories: 1500,
                         calorieGoal: 2000,
                         protein: 125,
                         carbs: 220,
                         fats: 45)
}
