//
//  HomeHeaderView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct HomeHeaderView: View {
    var username: String = "Maxwell"
    var currentWeek: [Date]
    var selectedDate: Date?
    var namespace: Namespace.ID
    var onDateChange: (Date) -> Void

    var body: some View {
        VStack(spacing: 12) {
            // Top Header
            ZStack {
                HStack {
                    // Left: Hamburger Menu
                    Button(action: {
                        // TODO: handle menu tap
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color(.systemGray))
                            .font(.title)
                    }
                    .padding(.top, 13)

                    Spacer()

                    // Right: Profile Icon
                    Button(action: {
                        // TODO: handle profile tap
                    }) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 13)
                }
                .padding(.horizontal) // optional: add horizontal padding for breathing room

                // Centered Greeting
                VStack(spacing: 4) {
                    Text("Welcome")
                        .foregroundStyle(Color(.systemGray2))

                    Text("\(username)")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .fontWeight(.light)
                }
                .padding(.top, 13)
        }
        
            // Week View
            HStack(spacing: 0) {
                ForEach(currentWeek, id: \.self) { date in
                    let isSameDate = date.isSame(selectedDate)

                    VStack(spacing: 6) {
                        Text(date.string("EEE"))
                            .font(.caption)
                            .foregroundColor(.white)

                        Text(date.string("dd"))
                            .font(.title3)
                            .foregroundStyle(isSameDate ? .black : .white)
                            .frame(width: 38, height: 38)
                            .background {
                                if isSameDate {
                                    Circle()
                                        .fill(.white)
                                        .matchedGeometryEffect(id: "ACTIVEDATE", in: namespace)
                                }
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
                            onDateChange(date)
                        }
                    }
                }
            }
            .frame(height: 40)
            .padding(.top, 30)

            // Month + Year (in white)
            HStack {
                Text(selectedDate?.string("MMM") ?? "")
                Spacer()
                Text(selectedDate?.string("yyyy") ?? "")
            }
            .font(.caption2)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .font(.caption2)
        .padding(.horizontal)
        .padding(.top, 1)          // tighten top space
        .padding(.bottom, 2)
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: Date())
    }
}

#Preview {
    @Namespace var namespace
    return HomeHeaderView(
        currentWeek: Date.currentWeek,
        selectedDate: .now,
        namespace: namespace,
        onDateChange: { _ in }
    )
}
