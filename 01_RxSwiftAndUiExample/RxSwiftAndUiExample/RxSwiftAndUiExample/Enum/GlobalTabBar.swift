//
//  GlobalTabBar.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/04.
//

import Foundation

enum GlobalTabBar: CaseIterable {
    case main
    case featured
    case profile

    // MARK: - Function

    // 配置するタイトルを取得する
    func getTabBarTitle() -> String {
        switch self {
        case .main:
            return "Main Contents"
        case .featured:
            return "Featured Contents"
        case .profile:
            return "User Profile"
        }
    }

    // 配置するSF Symbolsのアイコン名前を取得する
    func getTabBarSymbolName() -> String {
        switch self {
        case .main:
            return "doc.richtext.fill"
        case .featured:
            return "book.fill"
        case .profile:
            return "person.circle.fill"
        }
    }
}
