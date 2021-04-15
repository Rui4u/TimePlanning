//
//  WidgetItem.swift
//  TimePlanning
//
//  Created by 沙睿 on 2021/4/14.
//

import Foundation
import SwiftUI

struct WidgetItemModel {
    var name: String
}

struct WidgetItem: View {
    @Binding var columns : [GridItem]
    @Binding var viewsSource : [String]
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                LazyVGrid(columns: columns,alignment:.center, content: {
                    ForEach(0..<viewsSource.count, id:\.self) { item in
                        SwiftUIViewClock().frame(minWidth:proxy.size.width/2,minHeight:proxy.size.width/2, alignment: .center).scaleEffect(0.9)
                    }
                })
            }
        }
    }
}

