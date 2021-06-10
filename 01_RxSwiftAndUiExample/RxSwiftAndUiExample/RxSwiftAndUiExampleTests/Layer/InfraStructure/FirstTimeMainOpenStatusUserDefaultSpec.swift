//
//  FirstTimeMainOpenStatusUserDefaultSpec.swift
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

final class FirstTimeMainOpenStatusUserDefaultSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テスト対象の処理実装クラス
        // ※ 依存するクラスのMockが必要な場合は別途作成
        let target = FirstTimeMainOpenStatusUserDefaultImpl()

        // MEMO: テスト前に実行する処理
        // UserDefaultを空にする
        beforeEach {
            Defaults.removeAll()
        }

        // MEMO: このクラスにて実行したいテスト内容
        describe("FirstTimeMainOpenStatusUserDefaultImpl") {

            // MARK: - getFirstTimeMainOpenStatusを実行した際のテスト

            describe("#getFirstTimeMainOpenStatus") {
                context("Main画面起動が初回ではない場合") {
                    beforeEach {
                        Defaults[\.isMainOpenFirstTime] = false
                    }
                    it("falseを返す") {
                        expect(try! target.getFirstTimeMainOpenStatus().toBlocking().first()).to(equal(false))
                    }
                }
                context("Main画面起動が初回の場合") {
                    it("trueを返す") {
                        expect(try! target.getFirstTimeMainOpenStatus().toBlocking().first()).to(equal(true))
                    }
                }
            }

            // MARK: - setFirstTimeMainOpenFalseを実行した際のテスト

            describe("#setFirstTimeMainOpenFalse") {
                it("Completableを返却かつ値はfalseとなる") {
                    expect(try! target.setFirstTimeMainOpenFalse().toBlocking().first()).to(beNil())
                    expect(Defaults[\.isMainOpenFirstTime]).to(equal(false))
                }
            }
        }
    }
}
