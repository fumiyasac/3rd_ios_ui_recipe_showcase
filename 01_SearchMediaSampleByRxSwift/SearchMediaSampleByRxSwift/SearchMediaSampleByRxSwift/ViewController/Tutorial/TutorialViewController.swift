//
//  TutorialViewController.swift
//  SearchMediaSampleByRxSwift
//
//  Created by 酒井文也 on 2019/07/21.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

final class TutorialViewController: UIViewController {

    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    
    // MARK: -  Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGalleryCollectionView()
    }

    // MARK: -  Private Function

    private func setupGalleryCollectionView() {

        // UICollectionViewに関する初期設定
        tutorialCollectionView.isPagingEnabled = true
        tutorialCollectionView.isScrollEnabled = true
        tutorialCollectionView.showsHorizontalScrollIndicator = false
        tutorialCollectionView.showsVerticalScrollIndicator = false

        // UICollectionViewDelegate & UICollectionViewDataSourceに関する初期設定
        tutorialCollectionView.delegate = self
        tutorialCollectionView.dataSource = self
        tutorialCollectionView.registerCustomCell(TutorialCollectionViewCell.self)

        // UICollectionViewに付与するアニメーションに関する設定
        let layout = AnimatedCollectionViewLayout()
        layout.animator = ParallaxAttributesAnimator()
        layout.scrollDirection = .horizontal
        tutorialCollectionView.collectionViewLayout = layout
    }
}

// MARK: - UICollectionViewDataSource

extension TutorialViewController: UICollectionViewDelegate {
    
    // MEMO: 利用しないかもしれませんが一応準備をしておく
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {}
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {}
}

// MARK: - UICollectionViewDataSource

extension TutorialViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCustomCell(with: TutorialCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TutorialViewController: UICollectionViewDelegateFlowLayout {
    
    // セルのサイズを設定する
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = UIScreen.main.bounds.height
        return CGSize(width:cellWidth, height: cellHeight)
    }

    // セルの垂直方向の余白(margin)を設定する
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    // セルの水平方向の余白(margin)を設定する
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    // セル内のアイテム間の余白(margin)調整を行う
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
