//
//  AppConstants.swift
//  LayeredArchitectureAndUiExample
//
//  Created by 酒井文也 on 2020/11/18.
//

import Foundation

struct AppConstants {

    // このアプリの「Bundle Indentifier」名
    static let bundleIdentifier = Bundle.main.bundleIdentifier!

    // keychainAccessのKey名
    static let keychainAccessKeyName = "jsonAccessToken"

    // JWTのprefix名
    static let jwtTokenPrefix = "Bearer "
}
