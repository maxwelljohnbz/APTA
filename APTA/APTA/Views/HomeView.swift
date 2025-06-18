//
//  HomeView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                // Header with safe top padding for notch/Dynamic Island
                HomeHeaderView(username: "Max & William")
                    .safeAreaInset(edge: .top, spacing: 20) {
                        Color.clear.frame(height: 44)
                    }



                Spacer(minLength: 100) // Push content away from floating tab
            }
        }
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
