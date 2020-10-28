//
//  RealmAccessManager.swift
//  LayeredArchitectureAndUiExample
//
//  Created by 酒井文也 on 2020/10/29.
//

import Foundation
import RealmSwift

// ※ Mockに置き換えられるような形にしておくのがポイント

protocol RealmAccessProtocol {

    // 引数で与えられた型に該当するRealmオブジェクトを全件取得する
    func getAllObjects<T: Object>(_ realmObjectType: T.Type) -> Results<T>?

    // 該当するRealmオブジェクトを追加する
    func save<T: Object>(_ realmObject: T)

    // 該当するRealmオブジェクトを削除する
    func delete<T: Object>(_ realmObject: T)
}
