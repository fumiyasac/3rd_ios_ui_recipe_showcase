//
//  ApiAccessTokenRepository.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/15.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol ApiAuthenticatedTokenRepository {
    func find() -> Maybe<ApiAuthenticatedToken>
    func store(token: ApiAuthenticatedToken) -> Completable
    func clear() -> Completable
}

final class ApiAuthenticatedTokenRepositoryImpl: ApiAuthenticatedTokenRepository {

    private var apiAuthenticatedTokenUserDefault: ApiAuthenticatedTokenUserDefault

    // MARK: - Initializer

    init(apiAuthenticatedTokenUserDefault: ApiAuthenticatedTokenUserDefault) {
        self.apiAuthenticatedTokenUserDefault = apiAuthenticatedTokenUserDefault
    }

    // MARK: - ApiAuthenticatedTokenRepository

    func find() -> Maybe<ApiAuthenticatedToken> {
        return apiAuthenticatedTokenUserDefault.find().map { tokenString in
            ApiAuthenticatedToken(value: tokenString)
        }
    }

    func store(token: ApiAuthenticatedToken) -> Completable {
        return apiAuthenticatedTokenUserDefault.store(token: token)
    }
    
    func clear() -> Completable {
        return apiAuthenticatedTokenUserDefault.clear()
    }
}
