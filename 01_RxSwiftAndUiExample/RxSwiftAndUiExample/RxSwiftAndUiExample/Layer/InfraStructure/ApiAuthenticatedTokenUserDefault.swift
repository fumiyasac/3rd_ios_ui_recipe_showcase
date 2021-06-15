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
    func find() -> Maybe<String>
    func store(token: ApiAuthenticatedToken) -> Completable
    func clear() -> Completable
}

final class ApiAuthenticatedTokenUserDefaultImpl: ApiAuthenticatedTokenUserDefault {

    // MEMO: APIアクセス用のToken値を取得する
    func find() -> Maybe<String> {
        let token = Defaults[\.apiAuthenticatedToken]
        if token.isEmpty {
            return Maybe.empty()
        } else {
            return Maybe.just(token)
        }
    }

    // MEMO: APIアクセス用のToken値を保存する
    func store(token: ApiAuthenticatedToken) -> Completable {
        return Completable.create { completable in
            Defaults[\.apiAuthenticatedToken] = token.value
            completable(.completed)
            return Disposables.create()
        }
    }

    // MEMO: APIアクセス用のToken値を空にする
    func clear() -> Completable {
        return Completable.create { completable in
            Defaults[\.apiAuthenticatedToken] = ""
            completable(.completed)
            return Disposables.create()
        }
    }
}
