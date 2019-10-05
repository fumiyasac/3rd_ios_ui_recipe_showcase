//
//  TutorialModel.swift
//  SearchMediaSampleByRxSwift
//
//  Created by 酒井文也 on 2019/10/05.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import Foundation

struct TutorialModel: Decodable {

    let id: Int
    let title: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case title
    }
    
    // MARK: - Initializer
    
    init(from decoder: Decoder) throws {

        // JSONの配列内の要素を取得する
        let container = try decoder.container(keyedBy: Keys.self)

        // JSONの配列内の要素にある値をDecodeして初期化する
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
    }
}
