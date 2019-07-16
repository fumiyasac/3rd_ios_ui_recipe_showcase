//
//  UIViewControllerExtension.swift
//  SearchMediaSampleByRxSwift
//
//  Created by 酒井文也 on 2019/07/15.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import Foundation
import UIKit

// UIViewControllerの拡張
extension UIViewController {

    // この画面のナビゲーションバーを設定するメソッド
    func setupNavigationBarTitle(_ title: String) {

        guard let currentNavigationController = self.navigationController else {
            return
        }

        // NavigationControllerのフォントに関するデザイン調整を行う
        var attributes = [NSAttributedString.Key : Any]()
        attributes[NSAttributedString.Key.font] = UIFont(name: "HiraKakuProN-W6", size: 14.0)
        attributes[NSAttributedString.Key.foregroundColor] = UIColor(code: "#ffffff")

        // NavigationControllerの配色に関するデザイン調整を行う
        currentNavigationController.navigationBar.isTranslucent = false
        currentNavigationController.navigationBar.barTintColor = UIColor(code: "#ffae00")
        currentNavigationController.navigationController!.navigationBar.titleTextAttributes = attributes

        // タイトルを入れる
        self.navigationItem.title = title
    }
    
    // 戻るボタンの「戻る」テキストを削除した状態にするメソッド
    func removeBackButtonText() {
        guard let currentNavigationController = self.navigationController else {
            return
        }
        currentNavigationController.navigationBar.tintColor = UIColor(code: "#ffffff")

        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
    }
}

