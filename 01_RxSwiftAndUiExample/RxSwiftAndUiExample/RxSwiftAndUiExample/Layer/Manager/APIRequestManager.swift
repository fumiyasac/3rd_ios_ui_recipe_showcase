//
//  APIRequestManager.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/07.
//

import Foundation

// MARK: - Enum

// MEMO: APIリクエストの状態に関するEnum定義
enum APIRequestState {
    case none
    case requesting
    case success
    case error
}

// MARK: - Protocol

// ※ Mockに置き換えられるような形にしておくのがポイント

protocol APIRequestProtocol {

    // MEMO: 認証済みユーザーのAPIリクエスト

    // MEMO: 公開部分のAPIリクエスト
}

final class APIRequestManager: APIRequestProtocol {}
