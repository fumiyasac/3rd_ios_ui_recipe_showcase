//
//  ApplicationUserStatus.swift
//  LayeredArchitectureAndUiExample
//
//  Created by 酒井文也 on 2020/11/22.
//

import Foundation

// MEMO: チュートリアル画面・サインイン画面・コンテンツ用TabBar画面への遷移コントロールするための識別用
enum ApplicationUserStatus {

    // チュートリアル画面へ遷移する
    case needToMoveTutorialScreen
    // サインイン画面(会員登録画面)へ遷移する
    case needToMoveSigninScreen
    // コンテンツ用TabBar画面へ遷移する
    case needToMoveGlobalTabBarScreen
}
