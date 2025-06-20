//
//  MacroSummaryCard.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import SwiftUI

struct MacroSummaryCard: View {
    let title: String
    let value: Int
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 5)
                    .frame(width: 28, height: 28)

                Circle()
                    .trim(from: 0, to: 0.7) // Replace with dynamic fill later
                    .stroke(color, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 28, height: 28)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("\(value)g")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.backgroundColor1))
        .cornerRadius(16)
        .padding(.horizontal, 2)
        .shadow(radius: 5)
    }
}

#Preview {
    MacroSummaryCard(
        title: "Protein",
        value: 125,
        color: .green
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
