//
//  NSObjectProtocolExtension.swift
//  FavoriteSpotSampleByReSwift
//
//  Created by 酒井文也 on 2019/09/01.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import Foundation
import UIKit

// NSObjectProtocolの拡張
extension NSObjectProtocol {

    // MARK: - Static Property

    // クラス名を返す変数"className"を返す
    static var className: String {
        return String(describing: self)
    }
}