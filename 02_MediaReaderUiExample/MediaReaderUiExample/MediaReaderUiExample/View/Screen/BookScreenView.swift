//
//  BookScreenView.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct BookScreenView: View {
    var body: some View {
        ZStack {
            Text("This is `Book Screen View`")
                .foregroundColor( Color(hex: 0xfeca2c))
        }
     }
}

struct BookScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BookScreenView()
    }
}
