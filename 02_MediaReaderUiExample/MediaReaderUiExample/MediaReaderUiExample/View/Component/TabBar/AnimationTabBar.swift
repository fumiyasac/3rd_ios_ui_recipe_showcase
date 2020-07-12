//
//  AnimationTabBarComponentView.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct AnimationTabBar: View {

    // MARK: - @Binding

    @Binding var selectedTabBarIndex: AnimationTabBarIndex

    // MARK: - body

    var body: some View {
        HStack(spacing: 18.0) {
            TimelineButton(selectedTabBarIndex: $selectedTabBarIndex)
            Spacer(minLength: 15.0)
            FeaturedButton(selectedTabBarIndex: $selectedTabBarIndex)
            Spacer(minLength: 15.0)
            BookButton(selectedTabBarIndex: $selectedTabBarIndex)
        }
        .padding(.vertical, 6.0)
        .padding(.horizontal, 26.0)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(hex: 0xf7f7f7))
        .animation(.spring())
    }
}

// MARK: - PreviewProvider

struct AnimationTabBar_Previews: PreviewProvider {

    static var previews: some View {
        AnimationTabBar(selectedTabBarIndex: .constant(.timeline))
    }
}
