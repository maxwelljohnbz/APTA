//
//  CommunityContentView.swift
//  APTA
//
//  Created by Maxwell  on 6/20/25.
//

import SwiftUI

struct CommunityContentView: View {
    @Binding var isExpanded: Bool
    @Binding var offset: CGFloat

    let collapsedOffset: CGFloat = 200
    let expandedOffset: CGFloat = 130

    @State private var lastScrollOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color(.systemBackground))
                    .ignoresSafeArea(edges: .bottom)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Scroll offset detector
                        GeometryReader { proxy in
                            let y = proxy.frame(in: .named("communityScroll")).minY
                            Color.clear
                                .frame(height: 0)
                                .onChange(of: y) { value in
                                    let delta = value - lastScrollOffset

                                    if delta < -10 && !isExpanded {
                                        withAnimation(.spring()) {
                                            isExpanded = true
                                            offset = expandedOffset - collapsedOffset
                                        }
                                    }

                                    if value > 20 && isExpanded {
                                        withAnimation(.spring()) {
                                            isExpanded = false
                                            offset = 0
                                        }
                                    }

                                    lastScrollOffset = value
                                }
                        }
                        .frame(height: 0)

                        // Drag handle
                        Capsule()
                            .fill(Color(.systemGray2))
                            .frame(width: 80, height: 5)
                            .padding(.top, 8)

                        // Placeholder group content
                        VStack(spacing: 12) {
                            ForEach(1...10, id: \.self) { index in
                                CommunityRowView(
                                    title: "Community \(index)",
                                    subtitle: "Last chat · 2h ago"
                                )
                            }
                        }

                        Spacer(minLength: 40)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .coordinateSpace(name: "communityScroll")
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .offset(y: isExpanded ? expandedOffset : collapsedOffset)
            .animation(.easeInOut(duration: 0.25), value: isExpanded)
        }
    }
}

#Preview {
    @State var isExpanded = false
    @State var offset: CGFloat = 0

    return CommunityContentView(isExpanded: $isExpanded, offset: $offset)
}
