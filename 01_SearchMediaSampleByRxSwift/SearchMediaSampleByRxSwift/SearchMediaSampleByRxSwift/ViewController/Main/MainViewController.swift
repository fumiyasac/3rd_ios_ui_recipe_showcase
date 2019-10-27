//
//  MainViewController.swift
//  SearchMediaSampleByRxSwift
//
//  Created by 酒井文也 on 2019/07/13.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SideMenu
import BetterSegmentedControl

final class MainViewController: UIViewController {
    
    @IBOutlet weak private var articleContainer: UIView!
    @IBOutlet weak private var galleryContainer: UIView!
    @IBOutlet weak private var contentsSegmentedControl: BetterSegmentedControl!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContentsSegmentedControl()
    }

    // MARK: - Private Function

    private func setupContentsSegmentedControl() {
        
        // BetterSegmentedControlに関する初期設定
        contentsSegmentedControl.setIndex(0)
        contentsSegmentedControl.segments = LabelSegment.segments(withTitles: ["新着記事", "フォトギャラリー"])
        contentsSegmentedControl.indicatorViewBorderColor = UIColor(code: "#f7f7f7")
    }
}
