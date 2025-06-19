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
        VStack(spacing: 0) {
            HomeHeaderView(
                currentWeek: currentWeek,
                selectedDate: selectedDate,
                namespace: namespace,
                onDateChange: { date in selectedDate = date }
            )
            .environment(\.colorScheme, .dark)
            .padding(.top, 60) // Moves header down from Dynamic Island
            .padding(.bottom, 10)

            GeometryReader { geo in
                VStack {
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(.background)
                .clipShape(UnevenRoundedRectangle(
                    topLeadingRadius: 30,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 30,
                    style: .continuous
                ))
                .environment(\.colorScheme, .light)
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .background(Color(.backgroundColor1))
        .onAppear {
            guard selectedDate == nil else { return }
            selectedDate = currentWeek.first(where: { $0.isSame(.now) })
        }
    }
}

#Preview {
    HomeView()
}
