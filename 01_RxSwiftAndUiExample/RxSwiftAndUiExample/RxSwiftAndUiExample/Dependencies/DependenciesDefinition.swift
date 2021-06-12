//
//  DependenciesDefinition.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/05/30.
//

import Foundation
import RxSwift

final class DependenciesDefinition {

    // MARK: - Function

    func inject() {

        // MEMO: 同じProtocolを適合させるがLocalに保持したデータを利用したい際につける名前
        let local = "local"

        // MEMO: 処理を実行する際にバックグラウンドスレッドにしたい際につける名前
        let background = "background"

        // MEMO: インスタンスを保持するための場所
        let dependecies = DependeciesContainer.shared

        // MARK: - Scheduler

        // メインスレッド動作
        dependecies.register(
            ImmediateSchedulerType.self,
            impl: MainScheduler.instance
        )
        // バックグラウンドスレッド動作
        dependecies.register(
            ImmediateSchedulerType.self,
            impl: SerialDispatchQueueScheduler(qos: .default),
            name: background
        )

        // MARK: - Infra

        // MEMO: (1) UserDefault関連処理部分
        dependecies.register(
            ApiAuthenticatedTokenUserDefault.self,
            impl: ApiAuthenticatedTokenUserDefaultImpl()
        )
        dependecies.register(
            FirstTimeMainOpenStatusUserDefault.self,
            impl: FirstTimeMainOpenStatusUserDefaultImpl()
        )
        dependecies.register(
            QuestionnaireStatusUserDefault.self,
            impl: QuestionnaireStatusUserDefaultImpl()
        )

        // MARK: - Repository

        // MARK: - Scheduler

        // MARK: - Presenter
    }
}

// MARK: - PresenterFactory

final class PresenterFactory {
    
}

// MARK: - SQLiteMigrationFactory

final class SQLiteMigrationFactory {
    
}
