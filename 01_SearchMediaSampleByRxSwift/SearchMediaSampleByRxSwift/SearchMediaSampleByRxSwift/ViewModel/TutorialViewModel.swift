//
//  TutorialViewModel.swift
//  SearchMediaSampleByRxSwift
//
//  Created by 酒井文也 on 2019/10/05.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TutorialViewModelInputs {}

protocol TutorialViewModelOutputs {
    // 表示用データ取得
    var tutorialItems: Observable<[TutorialModel]> { get }
}

protocol TutorialViewModelType {
    var inputs: TutorialViewModelInputs  { get }
    var outputs: TutorialViewModelOutputs { get }
}

final class TutorialViewModel: TutorialViewModelInputs, TutorialViewModelOutputs, TutorialViewModelType {

    var inputs: TutorialViewModelInputs { return self }
    var outputs: TutorialViewModelOutputs { return self }

    // MARK: - Properties (for TutorialViewModelOutputs)

    var tutorialItems: Observable<[TutorialModel]> {
        return internalTutorialItems.asObservable()
    }

    //
    //
    private let internalTutorialItems: BehaviorRelay<[TutorialModel]> = BehaviorRelay<[TutorialModel]>(value: [])

    // MARK: - Initializer

    init() {
        // JSONファイルから表示用のデータを取得してFeaturedModelの型に合致するようにする
        guard let path = Bundle.main.path(forResource: "tutorial_datasources", ofType: "json") else {
            fatalError()
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError()
        }
        guard let models = try? JSONDecoder().decode([TutorialModel].self, from: data) else {
            fatalError()
        }

        // JSONファイルからの変換が完了したら
        internalTutorialItems.accept(models)
    }
}
