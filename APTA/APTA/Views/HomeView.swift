//
//  HomeView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct HomeView: View {
    @State private var currentWeek: [Date] = Date.currentWeek
    @State private var selectedDate: Date?
    @Namespace private var namespace
    @State private var offset: CGFloat = 0
    @State private var isExpanded: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            // Static header view
            VStack(spacing: 0) {
                HomeHeaderView(
                    username: "Maxwell",
                    currentWeek: currentWeek,
                    selectedDate: selectedDate,
                    namespace: namespace,
                    onDateChange: { date in selectedDate = date }
                )
                .environment(\.colorScheme, .dark)
                .padding(.top, 60)
                .padding(.bottom, 10)

                Spacer()
            }
            .background(Color(.backgroundColor1))
            .ignoresSafeArea()

            // Sliding white content panel (as component)
            HomeContentSheet(isExpanded: $isExpanded, offset: $offset)
        }
        .onAppear {
            guard selectedDate == nil else { return }
            selectedDate = currentWeek.first(where: { $0.isSame(.now) })
        }
    }
}

#Preview {
    HomeView()
}
