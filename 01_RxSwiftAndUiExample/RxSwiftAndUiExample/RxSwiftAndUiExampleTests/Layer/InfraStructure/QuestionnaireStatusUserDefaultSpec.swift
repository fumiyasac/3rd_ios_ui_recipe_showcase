//
//  QuestionnaireStatusUserDefaultSpec.swift
//  RxSwiftAndUiExampleTests
//
//  Created by 酒井文也 on 2021/06/10.
//

@testable import RxSwiftAndUiExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class QuestionnaireStatusUserDefaultSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テスト対象の処理実装クラス
        // ※ 依存するクラスのMockが必要な場合は別途作成
        let target = QuestionnaireStatusUserDefaultImpl()

        // MEMO: テスト前に実行する処理
        // UserDefaultを空にする
        beforeEach {
            Defaults.removeAll()
        }

        // MEMO: このクラスにて実行したいテスト内容
        describe("QuestionnaireStatusUserDefaultImpl") {

            // MARK: - getCurrentQuestionnaireStatusを実行した際のテスト

            describe("#getCurrentQuestionnaireStatus") {
                context("アンケート回答済の場合") {
                    beforeEach {
                        Defaults[\.isQuestionnaireFinished] = true
                    }
                    it("trueを返す") {
                        expect(try! target.getCurrentQuestionnaireStatus().toBlocking().first()).to(equal(true))
                    }
                }
                context("アンケート未回答の場合") {
                    it("falseを返す") {
                        expect(try! target.getCurrentQuestionnaireStatus().toBlocking().first()).to(equal(false))
                    }
                }
            }

            // MARK: - setQuestionnaireStatusTrueを実行した際のテスト

            describe("#setQuestionnaireStatusTrue") {
                it("Completableを返却かつ値はtrueとなる") {
                    expect(try! target.setQuestionnaireStatusTrue().toBlocking().first()).to(beNil())
                    expect(Defaults[\.isQuestionnaireFinished]).to(equal(true))
                }
            }
        }
    }
}
