//
//  ContentView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch tabSelection {
                case 0: HomeView()
                case 1: NutritionView()
                case 2: DiscoverView()
                case 3: CommunityView()
                case 4: ChallengesView()
                default: HomeView()
                }
            }
            //.padding(.bottom, 80) // push content up above tab bar
            .ignoresSafeArea(edges: .top) // only ignore top safe area
            
            // Floating Tab Bar
            FloatingTabBar(tabSelection: $tabSelection)
                .padding(.bottom, 30)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
