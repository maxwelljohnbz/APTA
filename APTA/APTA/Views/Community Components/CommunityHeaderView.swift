//
//  CommunityHeaderView.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import SwiftUI

import SwiftUI

struct CommunityHeaderView: View {
    var body: some View {
        VStack(spacing: 24) { // Match spacing to NutritionHeaderView
            // Title
            HStack {
                Text("Community")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 60) // Same top padding as NutritionHeaderView
            .padding(.horizontal)

            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("Search")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(30)
            .padding(.horizontal)
        }
        .padding(.bottom, 10)
        .background(Color(.backgroundColor1))
    }
}

#Preview {
    CommunityHeaderView()
}
