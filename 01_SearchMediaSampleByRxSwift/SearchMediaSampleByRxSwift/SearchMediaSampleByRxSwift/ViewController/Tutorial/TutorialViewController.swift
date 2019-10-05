//
//  TutorialViewController.swift
//  SearchMediaSampleByRxSwift
//
//  Created by 酒井文也 on 2019/07/21.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AnimatedCollectionViewLayout

final class TutorialViewController: UIViewController {

    private let disposeBag = DisposeBag()

    // このViewControllerで利用するViewModel
    private let viewModel = TutorialViewModel()

    @IBOutlet private weak var nextContentsButton: UIButton!
    @IBOutlet private weak var tutorialCollectionView: UICollectionView!

    // MARK: -  Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTutorialCollectionView()
        bindTutorialCollectionToRxSwift()
        bindNextButtonToRxSwift()
    }

    // MARK: -  Private Function

    private func setupTutorialCollectionView() {

        // UICollectionViewに関する初期設定
        tutorialCollectionView.isPagingEnabled = true
        tutorialCollectionView.isScrollEnabled = true
        tutorialCollectionView.showsHorizontalScrollIndicator = false
        tutorialCollectionView.showsVerticalScrollIndicator = false
        tutorialCollectionView.registerCustomCell(TutorialCollectionViewCell.self)

        // UICollectionViewに付与するアニメーションに関する設定
        let layout = AnimatedCollectionViewLayout()
        layout.animator = ParallaxAttributesAnimator()
        layout.scrollDirection = .horizontal
        tutorialCollectionView.collectionViewLayout = layout
    }

    private func bindTutorialCollectionToRxSwift() {

        // RxSwiftを利用してUICollectionViewDelegateを適用する
        // MEMO: RxSwiftを利用した方法で組み立てる場合でもUICollectionViewDelegate等を利用する場合は記載が必要です。
        tutorialCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        // RxSwiftを利用して一覧データをUICollectionViewに適用する
        // MEMO: UICollectionViewのHeader・Footerのレイアウト調整等が絡んで取り扱いにくい場合もあるので、状況に合わせて使い分けていくと良いかと思います。
        viewModel.tutorialItems.bind(to: tutorialCollectionView.rx.items) { (collectionView, row, model) in
                let cell = collectionView.dequeueReusableCustomCell(with: TutorialCollectionViewCell.self, indexPath: IndexPath(row: row, section: 0))
                cell.setCell()
                return cell
            }
            .disposed(by: disposeBag)

        // RxSwiftを利用して該当のセルをタップした場合にタップ時のindexPathを返す
        tutorialCollectionView.rx.itemSelected
            .asSignal()
            .emit(
                onNext: { [weak self] indexPath in
                    let cell = self?.tutorialCollectionView.cellForItem(at: indexPath) as! TutorialCollectionViewCell

                    print(indexPath.section)
                    print(indexPath.row)
                    print(cell)
                }
            )
            .disposed(by: disposeBag)

        // 参考: タップ時にセルに紐づいているModelを返す場合の記述例
        /*
        tutorialCollectionView.rx.modelSelected(TutorialModel.self)
            .asSignal()
            .emit(
                onNext: { model in
                    print(model)
                }
            )
            .disposed(by: disposeBag)
        */

        // RxSwiftを利用してUICollectionViewのオフセット値が変化した場合に見える範囲内のセルのindexPathを取得する
        // MEMO: UIScrollViewDelegateのScrollViewDidScrollを利用しても同様な表現が可能です。
        tutorialCollectionView.rx.contentOffset
            .subscribe(
                onNext: { [weak self] currentPoint in
                    guard let collectionView = self?.tutorialCollectionView else {
                        return
                    }
                    let visibleRect = CGRect(origin: currentPoint, size: collectionView.bounds.size)
                    let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                    if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
                        self?.viewModel.changeIndexTrigger.onNext(visibleIndexPath.row)
                    }
                }
            )
            .disposed(by: disposeBag)
    }

    private func bindNextButtonToRxSwift() {
        viewModel.changeIndexTrigger.onNext(0)
        viewModel.isLastIndex
            .subscribe(
                onNext: { [weak self] result in
                    self?.shouldDisplayNextButton(result)
                }
            )
            .disposed(by: disposeBag)
        nextContentsButton.rx.controlEvent(.touchDown)
            .asObservable()
            .subscribe(
                onNext: { [weak self] _ in
                    self?.executeNextButtonAnimationOfTouchDown()
                }
            )
            .disposed(by: disposeBag)
        nextContentsButton.rx.controlEvent(.touchUpInside)
            .asObservable()
            .subscribe(
                onNext: { [weak self] _ in
                    self?.executeNextButtonAnimationOfTouchUpInside()
                }
            )
            .disposed(by: disposeBag)
    }

    // コンテンツ表示ボタンの状態を決定する
    private func shouldDisplayNextButton(_ result: Bool) {
        nextContentsButton.isUserInteractionEnabled = result
        UIView.animate(withDuration: 0.18, animations: {
            self.nextContentsButton.superview?.alpha = result ? 1 : 0
        })
    }

    // コンテンツ表示ボタンの.touchDown時のAnimationを付与する
    private func executeNextButtonAnimationOfTouchDown() {
        UIView.animate(withDuration: 0.16, animations: {
            self.nextContentsButton.superview?.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        }, completion: nil)
    }

    // コンテンツ表示ボタンの.touchUpInside時のAnimationを付与する
    private func executeNextButtonAnimationOfTouchUpInside() {
        UIView.animate(withDuration: 0.16, animations: {
            self.nextContentsButton.superview?.transform = CGAffineTransform.identity
        }, completion: { finished in
            self.goMainContents()
        })
    }

    // コンテンツ表示画面へ遷移する
    private func goMainContents() {
        print("コンテンツ表示画面へ遷移する")
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
