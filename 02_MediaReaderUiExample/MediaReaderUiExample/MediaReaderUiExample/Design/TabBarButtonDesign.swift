//
//  TabBarButtonDesign.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import Foundation
import SwiftUI

struct TabBarButtonDesign {

    // MEMO: TabBarの配色設定
    static let timelineActivBackGroundColor = Color(hex: 0xff803a)
    static let featuredActiveBackGroundColor = Color(hex: 0x52cb52)
    static let bookActiveBackGroundColor = Color(hex: 0xfeca2c)

    static let deactiveBackgroundColor = Color.black.opacity(0.1)

    static let activeForegroundColor = Color.white
    static let deactiveForegroundColor = Color.black.opacity(0.5)

    // MEMO: TabBarのサイズ・フォント・SFSymbol名
    static let iconImageRect: CGFloat = 20.0

    static let nameTextFont: Font = .system(size: 11.0, weight: .bold, design: .rounded)

    static let timelineSymbolName = "photo.fill"
    static let featuredSymbolName = "iphone.homebutton"
    static let bookSymbolName = "book"
}
