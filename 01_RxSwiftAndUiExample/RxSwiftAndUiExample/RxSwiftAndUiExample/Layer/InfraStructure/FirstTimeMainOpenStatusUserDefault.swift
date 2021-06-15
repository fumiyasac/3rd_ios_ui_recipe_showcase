//
//  FirstTimeMainOpenStatusUserDefault.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/10.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol FirstTimeMainOpenStatusUserDefault {
    func get() -> Single<Bool>
    func changeFalse() -> Completable
}

final class FirstTimeMainOpenStatusUserDefaultImpl: FirstTimeMainOpenStatusUserDefault {

    // MARK: - FirstTimeMainOpenStatusUserDefault

    // MEMO: Main画面を初めて開いたかの状態を取得する
    func get() -> Single<Bool> {
        let isMainOpenFirstTime = Defaults[\.isMainOpenFirstTime]
        return Single.just(isMainOpenFirstTime)
    }

    // MEMO: Main画面を初めて開いた状態をfalseへ更新する
    func changeFalse() -> Completable {
        return Completable.create { completable in
            Defaults[\.isMainOpenFirstTime] = false
            completable(.completed)
            return Disposables.create()
        }
    }
}
