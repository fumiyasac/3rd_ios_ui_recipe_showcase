//
//  QuestionarrieViewController.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/06.
//

import UIKit

final class QuestionarrieViewController: UIViewController {
/*
    // MARK: - Properties

    // MEMO: Storyboard初期化時にDIすることで反映する形（iOS13からの新機能）
    private var presenter: QuestionarriePresenter!

    // MARK: - Initializer

    init?(coder: NSCoder, presenter: QuestionarriePresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }
*/
    required init?(coder: NSCoder) {
        // MEMO: Storyboardを利用するため実装を省略している
        fatalError()
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
    }    
}
