//
//  ContentView.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct ContentView: View {

    // MARK: - @State

    @State private var selectedTabBarIndex: AnimationTabBarIndex = .timeline

    // MARK: - body

    var body: some View {
        ZStack {
            switch self.selectedTabBarIndex {
            case .timeline:
                TimelineScreenView()
            case .featured:
                FeaturedScreenView()
            case .book:
                BookScreenView()
            }
            VStack {
                Spacer()
                AnimationTabBar(selectedTabBarIndex: $selectedTabBarIndex)
            }
        }
        .animation(.spring())
    }
}

// MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
