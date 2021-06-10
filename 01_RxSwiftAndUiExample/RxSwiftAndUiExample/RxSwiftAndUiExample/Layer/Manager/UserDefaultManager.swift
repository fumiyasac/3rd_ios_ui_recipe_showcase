//
//  DefaultsKeysExtension.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/01.
//

import Foundation
import SwiftyUserDefaults

// MEMO: ライブラリ「SwiftyUserDefaults」を利用して管理する

extension DefaultsKeys {

    // MARK: - Property

    // MEMO: アンケート入力画面を終了しているか
    var isQuestionnaireFinished: DefaultsKey<Bool> {
        .init("isQuestionnaireFinished", defaultValue: false)
    }

    // MEMO: 初めてメイン画面を開いたか
    var isMainOpenFirstTime: DefaultsKey<Bool> {
        .init("isMainOpenFirstTime", defaultValue: false)
    }

    // MEMO: APIリクエスト用の認証トークン
    var apiAuthenticatedToken: DefaultsKey<String> {
        .init("apiAuthenticatedToken", defaultValue: "")
    }
}
