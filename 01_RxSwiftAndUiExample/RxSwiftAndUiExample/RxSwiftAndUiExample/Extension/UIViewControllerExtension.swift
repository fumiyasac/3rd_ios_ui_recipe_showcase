//
//  UIViewControllerExtension.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/05/23.
//

import Foundation
import UIKit

// UIViewControllerの拡張
extension UIViewController {

    // この画面のナビゲーションバーを設定するメソッド
    public func setupNavigationBarTitle(_ title: String) {

        // NavigationControllerのデザイン調整を行う
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[NSAttributedString.Key.font] = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        attributes[NSAttributedString.Key.foregroundColor] = UIColor.white

        // NavigationBarをタイトル配色を決定する
        guard let nav = self.navigationController else {
            return
        }
        nav.navigationBar.barTintColor = UIColor(code: "#ff6670")
        nav.navigationBar.titleTextAttributes = attributes

        // タイトルを入れる
        self.navigationItem.title = title
    }

    // 戻るボタンの「戻る」テキストを削除した状態にするメソッド
    public func removeBackButtonText() {

        // NavigationBarをタイトル配色を決定する
        guard let nav = self.navigationController else {
            return
        }
        nav.navigationBar.tintColor = UIColor.white

        if #available(iOS 14.0, *) {
            self.navigationItem.backButtonDisplayMode = .minimal
            self.navigationItem.backButtonTitle = self.navigationItem.title
        } else {
            // 戻るボタンの文言を消す
            let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem = backButtonItem
        }
    }
}
