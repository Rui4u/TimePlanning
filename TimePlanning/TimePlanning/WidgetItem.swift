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
                LazyVGrid(columns: columns,alignment:.leading, content: {
                    ForEach(0..<maxNum, id:\.self) { item in
                        ZStack {
                            Rectangle()
                                .fill(Color.red)
                            Text("\(item)").font(Font.system(size: 10))
                        }.frame(width: 20, height: 20, alignment: .center)
                    }
                })
                .frame(width: proxy.size.width)
            }
        }
    }
}

struct WidgetItem_Previews: PreviewProvider {
    @State static var a = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    @State static var b = Int(arc4random() % 100) + 1
    static var previews: some View {
        WidgetItem(columns:$a , maxNum:$b).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
