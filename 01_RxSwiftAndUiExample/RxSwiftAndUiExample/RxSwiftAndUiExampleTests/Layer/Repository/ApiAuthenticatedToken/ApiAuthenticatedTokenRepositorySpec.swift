//
//  ApiAuthenticatedTokenRepositorySpec.swift
//  RxSwiftAndUiExampleTests
//
//  Created by 酒井文也 on 2021/06/19.
//

@testable import RxSwiftAndUiExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest


final class ApiAuthenticatedTokenRepositorySpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テスト対象の処理実装クラス

        // MEMO: 依存するクラスのMock
        let apiAuthenticatedTokenUserDefault = ApiAuthenticatedTokenUserDefaultMock()

        let target = ApiAuthenticatedTokenRepositoryImpl(
            apiAuthenticatedTokenUserDefault: apiAuthenticatedTokenUserDefault
        )

        let tokenString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjkwNDg5MSIsIm5hbWUiOiJGdW1peWEgU2FrYWkiLCJpYXQiOjE1MTYyMzkwMjJ9.HXQnb2yoMqVfCXYBxMx24bYN04U5q2IC4nG30cxywhM"

        // MEMO: このクラスにて実行したいテスト内容
        describe("ApiAuthenticatedTokenRepositoryImpl") {

            // MARK: - findを実行した際のテスト

            describe("#find") {
                context("Token値が存在しない場合") {
                    beforeEach {
                        apiAuthenticatedTokenUserDefault.given(
                            .find(
                                willReturn: Maybe.empty()
                            )
                        )
                    }
                    it("emptyが返却される") {
                        let maybe = target.find()
                        expect(try! maybe.toBlocking().first()).to(beNil())
                    }
                }
                context("Token値が存在する場合") {
                    beforeEach {
                        apiAuthenticatedTokenUserDefault.given(
                            .find(
                                willReturn: Maybe.just(tokenString)
                            )
                        )
                    }
                    it("ApiAuthenticatedTokenを返す") {
                        let apiAuthenticatedToken = ApiAuthenticatedToken(value: tokenString)
                        let maybe = target.find()
                        expect(try! maybe.toBlocking().first()).to(equal(apiAuthenticatedToken))
                    }
                }
            }

            // MARK: - storeを実行した際のテスト

            describe("#store") {
                let apiAuthenticatedToken = ApiAuthenticatedToken(value: tokenString)
                context("Token値を保存する場合") {
                    beforeEach {
                        apiAuthenticatedTokenUserDefault.given(
                            .store(
                                token: .value(apiAuthenticatedToken),
                                willReturn: Completable.empty()
                            )
                        )
                    }
                    it("Completableを返す") {
                        expect(try! target.store(token: apiAuthenticatedToken).toBlocking().first()).to(beNil())
                    }
                }
            }

            // MARK: - clearを実行した際のテスト

            describe("#clear") {
                context("Token値をクリアする場合") {
                    beforeEach {
                        apiAuthenticatedTokenUserDefault.given(
                            .clear(
                                willReturn: Completable.empty()
                            )
                        )
                    }
                    it("Completableを返す") {
                        expect(try! target.clear().toBlocking().first()).to(beNil())
                    }
                }
            }
        }
    }}
