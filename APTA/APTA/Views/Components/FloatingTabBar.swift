//
//  FloatingTabBar.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct FloatingTabBar: View {
    @Binding var tabSelection: Int

    // Icons for tabs
    let tabBarItems: [(icon: String, label: String)] = [
        ("house", "Home"),
        ("carrot", "Nutrition"),
        ("person.3", "Community"),
        ("flag.pattern.checkered", "Challenges")
    ]

    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 70)
                .foregroundStyle(Color(.secondarySystemBackground))
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 4)

            HStack {
                ForEach(0..<tabBarItems.count, id: \.self) { index in
                    Button {
                        withAnimation(.spring()) {
                            tabSelection = index
                        }
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: tabBarItems[index].icon)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(index == tabSelection ? Color.blue : Color.gray)

                            Text(tabBarItems[index].label)
                                .font(.caption2)
                                .foregroundStyle(index == tabSelection ? Color.blue : Color.gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal)
    }
}

#Preview {
    FloatingTabBar(tabSelection: .constant(0))
}
