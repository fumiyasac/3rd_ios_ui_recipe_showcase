//
//  FeaturedButton.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct FeaturedButton: View {

    // MARK: - Variables

    // TODO: この設定をPropertyWrapperにまとめる
    private let symbolName: String = TabBarButtonDesign.featuredSymbolName
    private let nameTextFont: Font = TabBarButtonDesign.nameTextFont

    private let imageWidth: CGFloat = TabBarButtonDesign.iconImageRect
    private let imageHeight: CGFloat = TabBarButtonDesign.iconImageRect

    private let activeForegroundColor: Color = TabBarButtonDesign.activeForegroundColor
    private let activeBackgroundColor: Color = TabBarButtonDesign.featuredActiveBackGroundColor

    private let activeTextColor: Color = TabBarButtonDesign.featuredActiveBackGroundColor

    private let deactiveForegroundColor: Color = TabBarButtonDesign.deactiveForegroundColor
    private let deactiveBackgroundColor: Color = TabBarButtonDesign.deactiveBackgroundColor

    // MARK: - @Binding

    @Binding var selectedTabBarIndex: AnimationTabBarIndex

    // MARK: - body

    var body: some View {
        Button(
            action: {
                selectedTabBarIndex = .featured
            },
            label: {
                VStack {
                    VStack {
                        if selectedTabBarIndex == .featured {
                            Image(systemName: symbolName)
                                .frame(width: imageWidth, height: imageHeight)
                                .foregroundColor(activeForegroundColor)
                                .padding()
                                .background(activeBackgroundColor)
                                .clipShape(Circle())
                                .offset(y: -16.0)
                                .padding(.bottom,  -16.0)
                            Text("Featured")
                                .foregroundColor(activeTextColor)
                                .font(nameTextFont)
                        } else {
                            Image(systemName: symbolName)
                                .frame(width: imageWidth, height: imageHeight)
                                .foregroundColor(deactiveForegroundColor)
                                .padding()
                                .background(deactiveBackgroundColor)
                                .clipShape(Circle())
                        }
                    }
                }
            }
        )
    }
}

// MARK: - PreviewProvider

struct FeaturedButton_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedButton(selectedTabBarIndex: .constant(.featured))
    }
}
