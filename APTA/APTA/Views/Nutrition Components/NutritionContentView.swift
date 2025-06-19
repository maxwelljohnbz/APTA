//
//  NutritionContentView.swift
//  APTA
//
//  Created by Maxwell  on 6/19/25.
//

import SwiftUI

struct NutritionContentView: View {
    @Binding var isExpanded: Bool
    @Binding var offset: CGFloat

    let collapsedOffset: CGFloat = 190
    let expandedOffset: CGFloat = 130

    @State private var lastScrollOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color(.systemBackground))
                    .ignoresSafeArea(edges: .bottom)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Invisible reader at top to detect scroll movement
                        GeometryReader { proxy in
                            let y = proxy.frame(in: .named("scroll")).minY
                            Color.clear
                                .frame(height: 0)
                                .onChange(of: y) { value in
                                    let delta = value - lastScrollOffset

                                    // Expand if scrolling up
                                    if delta < -10 && !isExpanded {
                                        withAnimation(.spring()) {
                                            isExpanded = true
                                            offset = expandedOffset - collapsedOffset
                                        }
                                    }

                                    // Collapse if scrolled to top and pulling down
                                    if value > 20 && isExpanded {
                                        withAnimation(.spring()) {
                                            isExpanded = false
                                            offset = 0
                                        }
                                    }

                                    lastScrollOffset = value
                                }
                        }
                        .frame(height: 0)

                        // Drag handle
                        Capsule()
                            .fill(Color(.systemGray2))
                            .frame(width: 80, height: 5)
                            .padding(.top, 8)

                        // Summary content
                        NutritionSummaryCard(
                            calories: 1500,
                            calorieGoal: 2000,
                            protein: 125,
                            carbs: 220,
                            fats: 45
                        )
                        .padding(.horizontal, 15)

                        // Placeholder additional content
                        ForEach(0..<8, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                                .frame(height: 100)
                                .padding(.horizontal)
                        }

                        Spacer(minLength: 40)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .coordinateSpace(name: "scroll")
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .offset(y: isExpanded ? expandedOffset : collapsedOffset)
            .animation(.easeInOut(duration: 0.25), value: isExpanded)
        }
    }
}

#Preview {
    @State var isExpanded = false
    @State var offset: CGFloat = 0

    return NutritionContentView(isExpanded: $isExpanded, offset: $offset)
}
