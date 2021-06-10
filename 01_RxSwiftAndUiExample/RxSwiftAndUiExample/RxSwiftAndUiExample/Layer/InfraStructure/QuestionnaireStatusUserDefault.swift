//
//  QuestionnaireStatusUserDefault.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/10.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol QuestionnaireStatusUserDefault {
    func getCurrentQuestionnaireStatus() -> Single<Bool>
    func setQuestionnaireStatusTrue() -> Completable
}

final class QuestionnaireStatusUserDefaultImpl: QuestionnaireStatusUserDefault {

    // MEMO: UserDefault内の現在のアンケート回答状況を取得する
    func getCurrentQuestionnaireStatus() -> Single<Bool> {
        let isQuestionnaireFinished = Defaults[\.isQuestionnaireFinished]
        return Single.just(isQuestionnaireFinished)
    }

    // MEMO: UserDefault内のアンケート回答状況を回答済みに更新する
    func setQuestionnaireStatusTrue() -> Completable {
        return Completable.create { completable in
            Defaults[\.isQuestionnaireFinished] = true
            completable(.completed)
            return Disposables.create()
        }
    }
}
