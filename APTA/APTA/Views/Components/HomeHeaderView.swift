//
//  HomeHeaderView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct HomeHeaderView: View {
    var username: String = "Max & William"
    
    var body: some View {
        HStack {
            // Left Icon
            Button(action: {}) {
                Image(systemName: "figure.mind.and.body")
                    .resizable()
                    .frame(width: 36, height: 36)
            }

            Spacer()

            // Greeting + Date Centered Block
            VStack(spacing: 4) {
                Text("Hello, \(username)")
                    .font(.title2)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)

                Text(formattedDate)
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)

            Spacer()

            // Right Icon
            Button(action: {}) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: Date())
    }
}

#Preview {
    HomeHeaderView()
}
