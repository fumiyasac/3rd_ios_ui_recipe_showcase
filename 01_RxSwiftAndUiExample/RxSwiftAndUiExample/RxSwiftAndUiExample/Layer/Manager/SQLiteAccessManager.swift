//
//  SQLiteAccessManager.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/05.
//

import Foundation
import GRDB

// MARK: - Protocol

protocol SQLiteAccessProtocol {}

final class SQLiteAccessManager: SQLiteAccessProtocol {

    // MARK: - Singleton Instance

    static let shared = SQLiteAccessManager()

    // MARK: - Properies

    private let databaseQueue = DatabaseQueue()

    // MARK: - Function
}

