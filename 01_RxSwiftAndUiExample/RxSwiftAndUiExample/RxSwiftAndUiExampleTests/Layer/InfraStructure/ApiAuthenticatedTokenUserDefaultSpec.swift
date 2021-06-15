//
//  ApiAuthenticatedTokenUserDefaultSpec.swift
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

final class ApiAuthenticatedTokenUserDefaultSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テスト対象の処理実装クラス
        // ※ 依存するクラスのMockが必要な場合は別途作成
        let target = ApiAuthenticatedTokenUserDefaultImpl()

        // MEMO: テスト前に実行する処理
        // UserDefaultを空にする
        beforeEach {
            Defaults.removeAll()
        }

        // MEMO: このクラスにて実行したいテスト内容
        describe("ApiAuthenticatedTokenUserDefaultImpl") {

            // MARK: - findを実行した際のテスト

            describe("#find") {
                context("Token値が存在する場合") {
                    // MEMO: 仮で定めたToken文字列
                    let tokenString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjkwNDg5MSIsIm5hbWUiOiJGdW1peWEgU2FrYWkiLCJpYXQiOjE1MTYyMzkwMjJ9.HXQnb2yoMqVfCXYBxMx24bYN04U5q2IC4nG30cxywhM"
                    beforeEach {
                        Defaults[\.apiAuthenticatedToken] = tokenString
                    }
                    it("Token値を返す") {
                        expect(try! target.find().toBlocking().first()).to(equal(tokenString))
                    }
                }
                context("Token値が存在しない場合") {
                    it("何も返さない") {
                        expect(try! target.find().toBlocking().first()).to(beNil())
                    }
                }
            }

            // MARK: - storeを実行した際のテスト

            describe("#store") {
                context("Token値を保存する場合") {
                    // MEMO: 仮で定めたToken文字列
                    let tokenString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjkwNDg5MSIsIm5hbWUiOiJGdW1peWEgU2FrYWkiLCJpYXQiOjE1MTYyMzkwMjJ9.HXQnb2yoMqVfCXYBxMx24bYN04U5q2IC4nG30cxywhM"
                    let apiAuthenticatedToken = ApiAuthenticatedToken(value: tokenString)
                    it("Completable & Token文字列が保存されている") {
                        expect(try! target.store(token: apiAuthenticatedToken).toBlocking().first()).to(beNil())
                        expect(Defaults[\.apiAuthenticatedToken]).to(equal(tokenString))
                    }
                }
            }

            // MARK: - clearを実行した際のテスト

            describe("#clear") {
                context("Token値をクリアする場合") {
                    it("Completable & 空文字列が保存されている") {
                        expect(try! target.clear().toBlocking().first()).to(beNil())
                        expect(Defaults[\.apiAuthenticatedToken]).to(equal(""))
                    }
                }
            }
        }
    }
}
