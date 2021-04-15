//
//  SwiftUIViewClock.swift
//  TimePlanning
//
//  Created by sharui on 2021/4/15.
//

import SwiftUI

struct SwiftUIViewClock: View {
    typealias DateModel = (dateString:String, date:(year:String,
                                                    month:String,
                                                    day:String,
                                                    hour:String,
                                                    minute:String,
                                                    second:String))
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var dateModel: DateModel?
    @State var hourAngle = 0.0 //表示图像视图进行旋转的角度
    @State var minAngle = 0.0 //表示图像视图进行旋转的角度
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.yellow, style: FillStyle())
            ZStack {
                GeometryReader { geometry in
                    Image("clock_dial_style_1")
                        .resizable(resizingMode: .stretch)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    let maxlenght = min(geometry.size.width, geometry.size.height)
                    let line2Height = (maxlenght / 200) * 55
                    SwiftUIViewClockHandle(minAngle: $hourAngle, size: CGSize(width: 10, height: line2Height))
                    SwiftUIViewClockHandle(minAngle: $minAngle, size: CGSize(width: 10, height: line2Height))
                    Image("clock_round_style_1")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 10 + 4,height: 10 + 4)
                        .position(x: geometry.size.width/2, y: geometry.size.height/2)
                }
            }.padding(5)
        }.onReceive(timer) { time in
            self.changeTime(timeInterval: time.timeIntervalSince1970)
        }.onAppear() {
            changeTime(timeInterval: Date(timeIntervalSinceNow: 0).timeIntervalSince1970)
        }
    }
    
    
    
    
    func changeTime(timeInterval:Double) {
        self.dateModel = timeIntervalChangeToTimeStr(timeInterval: Date(timeIntervalSinceNow: 0).timeIntervalSince1970)
        let scal = Double(Int(self.dateModel!.date.minute) ?? 0 % 60) / 60
        minAngle = scal * 360
        hourAngle = Double(Int(self.dateModel!.date.hour) ?? 0 % 12) / 12 * 360 + (scal * 360 / 12)
    }
    
    func timeIntervalChangeToTimeStr(timeInterval:Double, _ dateFormat:String? = "yyyy-MM-dd HH:mm:ss") -> DateModel {
        let date:Date = Date.init(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter.init()
        if dateFormat == nil {
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }else{
            formatter.dateFormat = dateFormat
        }
        
        let dateString = formatter.string(from: date as Date)
        let tempArray = dateString.components(separatedBy:" ");
        var tempArray2 = [String]()
        for item in tempArray {
            var temp = ":"
            if item.contains("-") {
                temp = "-"
            }
            _ = item.components(separatedBy: temp).map { (str) -> String in
                tempArray2.append(str)
                return str
            }
        }
        return (dateString,(tempArray2[0],tempArray2[1],tempArray2[2],tempArray2[3],tempArray2[4],tempArray2[5]))
    }
    
}

struct SwiftUIViewClock_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewClock()
            .previewLayout(.fixed(width: 200, height: 200)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct SwiftUIViewClockHandle: View {
    @Binding var minAngle: Double //表示图像视图进行旋转的角度
    var size: CGSize
    var body: some View {
        GeometryReader { geometry in
            Image("clock_hand_style_1")
                    .resizable()
            .frame(width:size.width,height: size.height)
            .rotationEffect(Angle(degrees: minAngle),anchor: UnitPoint(x: 0.5, y: 1))
            .position(CGPoint(x: geometry.size.width/2, y: geometry.size.height/2 - size.height/2))
        }
    }
}
