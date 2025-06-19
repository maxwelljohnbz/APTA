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
                        HStack(spacing: 6) {
                            Image(systemName: "calendar")
                            Text("Today")
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }

                    Spacer()

                    HStack(spacing: 12) {
                        Button(action: {
                            // Edit action
                        }) {
                            Image(systemName: "pencil")
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 24, height: 24)
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
                                .frame(width: 24, height: 24)
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
    }

    #Preview {
        NutritionHeaderView()
            .background(Color.blue)
    }
