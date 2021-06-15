//
//  ApiAccessToken.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/15.
//

import Foundation

struct ApiAuthenticatedToken: ValueObject, Equatable, Codable {

    let value: String

    // MARK: - Initializer

    init(value: String) {
        self.value = value
    }

    // MARK: - Equatable

    static func == (lhs: ApiAuthenticatedToken, rhs: ApiAuthenticatedToken) -> Bool {
        return lhs.value == rhs.value
    }
}
