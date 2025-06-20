//
//  NutritionHeaderView.swift
//  APTA
//
//  Created by Maxwell  on 6/19/25.
//

import SwiftUI

struct NutritionHeaderView: View {
    var body: some View {
            VStack(spacing: 24) {
                // Top: Title
                HStack {
                    Text("Nutrition")
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.top, 60)
                .padding(.horizontal)

                // Buttons row
                HStack {
                    Button(action: {
                        // Date action
                    }) {
                        HStack() {
                            Image(systemName: "calendar")
                            Text(currentFormattedDate)
                        }
                        .padding(.vertical, 14)
                        .padding(.horizontal, 10)
                        .frame(width: 250, alignment: .leading)
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                        Spacer()
                    }

                    Spacer()

                    HStack(spacing: 12) {
                        Button(action: {
                            // Edit action
                        }) {
                            Image(systemName: "pencil")
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 30, height: 30)
                                .padding(8)
                                .background(Color.white.opacity(0.1))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }

                        Button(action: {
                            // Menu action
                        }) {
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90))
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 30, height: 30)
                                .padding(8)
                                .background(Color.white.opacity(0.1))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    private var currentFormattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: Date())
    }
}

    #Preview {
        NutritionHeaderView()
            .background(Color.blue)
    }
