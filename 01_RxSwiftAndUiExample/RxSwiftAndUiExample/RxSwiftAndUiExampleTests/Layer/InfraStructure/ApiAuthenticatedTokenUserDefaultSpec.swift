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

            // MARK: - setApiAuthenticatedTokenを実行した際のテスト

            describe("#setApiAuthenticatedToken") {

                // MEMO: 仮で定めたToken文字列
                let sampleToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjkwNDg5MSIsIm5hbWUiOiJGdW1peWEgU2FrYWkiLCJpYXQiOjE1MTYyMzkwMjJ9.HXQnb2yoMqVfCXYBxMx24bYN04U5q2IC4nG30cxywhM"
                it("Completableを返却かつ受け取った文字列が保存されている") {
                    expect(try! target.setApiAuthenticatedToken(sampleToken).toBlocking().first()).to(beNil())
                    expect(Defaults[\.apiAuthenticatedToken]).to(equal(sampleToken))
                }
            }

            // MARK: - clearApiAuthenticatedTokenを実行した際のテスト

            describe("#clearApiAuthenticatedToken") {
                it("Completableを返却かつ空文字列が保存されている") {
                    expect(try! target.clearApiAuthenticatedToken().toBlocking().first()).to(beNil())
                    expect(Defaults[\.apiAuthenticatedToken]).to(equal(""))
                }
            }
        }
    }
}
