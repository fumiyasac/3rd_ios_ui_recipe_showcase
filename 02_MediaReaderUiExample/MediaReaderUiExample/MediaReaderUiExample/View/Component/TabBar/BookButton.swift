//
//  BookButton.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct BookButton: View {

    // MARK: - Variables

    // TODO: この設定をPropertyWrapperにまとめる
    private let symbolName: String = TabBarButtonDesign.bookSymbolName
    private let nameTextFont: Font = TabBarButtonDesign.nameTextFont

    private let imageWidth: CGFloat = TabBarButtonDesign.iconImageRect
    private let imageHeight: CGFloat = TabBarButtonDesign.iconImageRect

    private let activeForegroundColor: Color = TabBarButtonDesign.activeForegroundColor
    private let activeBackgroundColor: Color = TabBarButtonDesign.bookActiveBackGroundColor

    private let activeTextColor: Color = TabBarButtonDesign.bookActiveBackGroundColor

    private let deactiveForegroundColor: Color = TabBarButtonDesign.deactiveForegroundColor
    private let deactiveBackgroundColor: Color = TabBarButtonDesign.deactiveBackgroundColor

    // MARK: - @Binding

    @Binding var selectedTabBarIndex: AnimationTabBarIndex

    // MARK: - body

    var body: some View {
        Button(
            action: {
                selectedTabBarIndex = .book
            },
            label: {
                VStack {
                    VStack {
                        if selectedTabBarIndex == .book {
                            Image(systemName: symbolName)
                                .frame(width: imageWidth, height: imageHeight)
                                .foregroundColor(activeForegroundColor)
                                .padding()
                                .background(activeBackgroundColor)
                                .clipShape(Circle())
                                .offset(y: -16.0)
                                .padding(.bottom,  -16.0)
                            Text("Book")
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

struct BookButton_Previews: PreviewProvider {
    static var previews: some View {
        BookButton(selectedTabBarIndex: .constant(.book))
    }
}
