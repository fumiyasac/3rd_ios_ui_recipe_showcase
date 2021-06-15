//
//  RootViewController.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/05/23.
//

import UIKit

final class RootViewController: UIViewController, RootView {

    // MARK: - Properties

    // MEMO: Storyboard初期化時にDIすることで反映する形（iOS13からの新機能）
    //private var presenter: RootPresenter!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        // MEMO: RootViewControllerのみ例外的にViewDidLoadのタイミングでPresenterを適用する
        // Info.plistにて起動直後に表示する画面として設定しているため
        //presenter = PresenterFactory.createRootPresenter()
        //presenter.viewDidLoadTrigger()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        //presenter.viewDidAppearTrigger()
    }

    // MARK: - RootView

    func moveToQuestionarrieScreen() {
        
    }

    func moveToSigninScreen() {
        
    }
}
