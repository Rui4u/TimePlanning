//
//  WidgetItem.swift
//  TimePlanning
//
//  Created by 沙睿 on 2021/4/14.
//

import Foundation
import SwiftUI
struct WidgetItem: View {
    @Binding var columns : [GridItem]
    @Binding var maxNum : Int
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                LazyVGrid(columns: columns, content: {
                    Print("\(maxNum)")
                    ForEach(0..<maxNum, id:\.self) { item in
                        ZStack {
                            Print("\(item)")
                            Rectangle()
                                .fill(Color.red)
                            Text("\(item)")
                        }
                    }
                }).frame(width: proxy.size.width)
            }
        }
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
