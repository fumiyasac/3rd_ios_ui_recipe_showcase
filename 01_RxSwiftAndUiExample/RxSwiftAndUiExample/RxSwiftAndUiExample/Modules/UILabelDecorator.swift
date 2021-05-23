//
//  UILabelDecorator.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/05/23.
//

import Foundation
import UIKit

final class UILabelDecorator {

    // MARK: - Typealias

    typealias KeysForDecoration = (lineSpacing: CGFloat, font: UIFont, foregroundColor: UIColor)

    // MARK: - Static Function

    // 該当のUILabelに付与する属性を設定する
    static func getLabelAttributesBy(keys: KeysForDecoration, label: UILabel) -> [NSAttributedString.Key : Any] {

        // MEMO: Fontサイズを考慮して行間を設定するために「実際に設定する行間 - (UILabelのlineHeight) - (UILabelのpointSize)」とする
        // 参考：iOSアプリでLine Heightを設定するときに注意したいこと
        // https://speakerdeck.com/rockname/things-to-keep-in-mind-when-setting-line-height-in-your-ios-app
        let fixedLineSpacing = keys.lineSpacing - (label.font.lineHeight - label.font.pointSize)

        // 行間に関する設定をする
        // MEMO: lineBreakModeの指定しないとはみ出た場合の「...」が出なくなる
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = fixedLineSpacing
        paragraphStyle.lineBreakMode = .byTruncatingTail

        // 上記で定義した行間・フォント・色を属性値として設定する
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        attributes[NSAttributedString.Key.font] = keys.font
        attributes[NSAttributedString.Key.foregroundColor] = keys.foregroundColor

        return attributes
    }
}
