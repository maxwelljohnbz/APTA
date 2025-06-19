//
//  HomeContentView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct HomeContentSheet: View {
    @Binding var isExpanded: Bool
    @Binding var offset: CGFloat

    let collapsedOffset: CGFloat = 250
    let expandedOffset: CGFloat = 130

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color(.systemBackground))
                    .ignoresSafeArea(edges: .bottom)

                VStack(spacing: 16) {
                    // Handle
                    Capsule()
                        .fill(Color(.systemGray2))
                        .frame(width: 80, height: 5)
                        .padding(.top, 8)
                    
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .offset(y: max(isExpanded ? expandedOffset : collapsedOffset + offset, expandedOffset))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        let newOffset = gesture.translation.height
                        if isExpanded {
                            offset = max(newOffset + (expandedOffset - collapsedOffset), 0)
                        } else {
                            offset = max(newOffset, 0)
                        }
                    }
                    .onEnded { gesture in
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            if gesture.translation.height < -100 {
                                offset = expandedOffset - collapsedOffset
                                isExpanded = true
                            } else {
                                offset = 0
                                isExpanded = false
                            }
                        }
                    }
            )
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

#Preview {
    StatefulPreviewWrapper(false) { isExpanded in
        StatefulPreviewWrapper(CGFloat(0)) { offset in
            HomeContentSheet(isExpanded: isExpanded, offset: offset)
        }
    }
}

