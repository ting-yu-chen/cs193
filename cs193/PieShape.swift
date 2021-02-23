//
//  PieShape.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/23.
//

import SwiftUI

struct PieShape: Shape {
    var startAngle:Angle
    var endAngle:Angle
    var clockwise:Bool = true 
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.height, rect.width)/2;
        let startPoint = CGPoint(x: center.x + radius*cos(CGFloat(startAngle.radians)),
                                 y: center.y + radius*sin(CGFloat(startAngle.radians)))
        var p = Path()
        p.move(to: center)
        p.addLine(to: startPoint)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        return p
    }
}
