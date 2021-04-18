//
//  SwiftUIViewPlanDefault.swift
//  TimePlanning
//
//  Created by 沙睿 on 2021/4/18.
//

import SwiftUI

struct SwiftUIViewPlanDefault: View {
    var gradient: Gradient {
              let stops: [Gradient.Stop] = [
                  .init(color: .red, location: 0.5),
                  .init(color: .yellow, location: 0.5)
              ]
              return Gradient(stops: stops)
          }
    var gardient2: Gradient {
        return Gradient(colors: [Color("blues"), Color("blue")])
    }
    var body: some View {
        ZStack {
            
                
            VStack(alignment: .leading) {
                HStack {
                    Text("北京市").font(.body)
                    Image(systemName: "location.fill")
                    Spacer()
                }
                Text("25")
                    .font(.largeTitle)
                Spacer()
                Image(systemName: "sun.min.fill").foregroundColor(.yellow)
                Text("晴天").font(.footnote)
                HStack {
                    Text("最高:25")
                    Text("最低:8")
                }.font(.footnote)
            }.foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient:gardient2,
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)))
            
        }
    }
}

struct SwiftUIViewPlanDefault_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewPlanDefault().previewLayout(.fixed(width: 200, height: 200))
    }
}
