//
//  CommunityRowView.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import SwiftUI

struct CommunityRowView: View {
    var title: String = "Community 1"
    var subtitle: String = "Last chat..."

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray))
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray))
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    CommunityRowView()
}
