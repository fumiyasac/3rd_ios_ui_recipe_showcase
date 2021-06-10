//
//  ApiAuthenticatedTokenUserDefault.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/10.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol ApiAuthenticatedTokenUserDefault {
    func setApiAuthenticatedToken(_ token: String) -> Completable
    func clearApiAuthenticatedToken() -> Completable
}

final class ApiAuthenticatedTokenUserDefaultImpl: ApiAuthenticatedTokenUserDefault {

    // MEMO: APIアクセス用のToken値を保存する
    func setApiAuthenticatedToken(_ token: String) -> Completable {
        return Completable.create { completable in
            Defaults[\.apiAuthenticatedToken] = token
            completable(.completed)
            return Disposables.create()
        }
    }

    // MEMO: APIアクセス用のToken値を空にする
    func clearApiAuthenticatedToken() -> Completable {
        return Completable.create { completable in
            Defaults[\.apiAuthenticatedToken] = ""
            completable(.completed)
            return Disposables.create()
        }
    }
}
