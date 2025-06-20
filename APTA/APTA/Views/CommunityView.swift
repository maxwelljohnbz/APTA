//
//  CommunityView.swift
//  APTA
//
//  Created by Maxwell  on 6/18/25.
//

import SwiftUI

struct CommunityView: View {
    @Namespace private var namespace
    @State private var offset: CGFloat = 0
    @State private var isExpanded: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            // Static header view
            VStack(spacing: 0) {
                CommunityHeaderView()
                    .environment(\.colorScheme, .dark)
                    .padding(.top, 15)
                    .padding(.bottom, 10)

               Spacer()
            }
            .background(Color(.backgroundColor1))
            .ignoresSafeArea()

            CommunityContentView(isExpanded: $isExpanded, offset: $offset)
        }
    }
}

#Preview {
    CommunityView()
}
