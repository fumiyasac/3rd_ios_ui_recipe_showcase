//
//  TypeScanner.swift
//  LayeredArchitectureAndUiExample
//
//  Created by 酒井文也 on 2020/11/22.
//

import Foundation

// MEMO: PropertyWrappersを利用したDependency Injectionにて名前とDIをするクラスと対応させるために利用する

final class TypeScanner {

    // MARK: - Static Function

    static func getName<T>(_ type: T) -> String {
        return NSString(string: "\(type)").components(separatedBy: ".").last!
    }
}
