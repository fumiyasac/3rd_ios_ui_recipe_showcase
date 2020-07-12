//
//  TimelineScreenView.swift
//  MediaReaderUiExample
//
//  Created by 酒井文也 on 2020/07/12.
//

import SwiftUI

struct TimelineScreenView: View {
    var body: some View {
        ZStack {
            Text("This is `Timeline Screen View`")
                .foregroundColor(Color(hex: 0xff803a))
        }
    }
}

struct TimelineScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineScreenView()
    }
}
