//
//  FeaturedScreenView.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct FeaturedScreenView: View {
    var body: some View {
        ZStack {
            Text("This is `Featured Screen View`")
                .foregroundColor(Color(hex: 0x52cb52))
        }
    }
}

struct FeaturedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedScreenView()
    }
}
