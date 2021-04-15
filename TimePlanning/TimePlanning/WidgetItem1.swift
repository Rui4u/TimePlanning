//
//  WidgetItem1.swift
//  TimePlanning
//
//  Created by sharui on 2021/4/15.
//

import SwiftUI

struct WidgetItem1: View {
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.yellow, style: FillStyle())
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("今天走了").font(.title3)
                        Spacer()
                    }
                    Rectangle()
                        .fill(Color.clear, style: FillStyle())
                        .frame(width: 10, height: 10, alignment: .center)
                    HStack {
                        Text("1302").font(.largeTitle)
                        VStack {
                            Spacer()
                            Text("步")
                        }
                    }.frame(height: 30)
                    ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            })
        }
    }
}

struct WidgetItem1_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetItem1().previewLayout(.fixed(width: 200, height: 200)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
