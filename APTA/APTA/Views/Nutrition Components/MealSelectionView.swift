//
//  MealSelectionView.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import SwiftUI

struct MealSelectionView: View {
    @Binding var selectedMeal: MealType

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(MealType.allCases, id: \.self) { meal in
                    Button(action: {
                        selectedMeal = meal
                    }) {
                        Text(meal.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(selectedMeal == meal ? .black : .white)
                            .frame(minWidth: 100, minHeight: 45)
                            .padding(.horizontal, 12)
                            .background(
                                selectedMeal == meal ?
                                Color(.systemGray6) :
                                Color(.backgroundColor1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(radius: 3)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 4)
            .padding(.bottom, 4)
        }
    }
}

#Preview {
    @State var meal: MealType = .breakfast
    return MealSelectionView(selectedMeal: $meal)
        .background(Color.black)
}
