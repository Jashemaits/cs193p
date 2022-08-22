//
//  Diamond.swift
//  Set
//
//  Created by Mohammad Jashem on 8/16/22.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let centerX = rect.midX
        let centerY = rect.midY
        let radius = (min(rect.width, rect.height) /  2)
        var p = Path()
        p.move(to: CGPoint(x: centerX + radius, y: centerY))
        p.addLine(to: CGPoint(x: centerX, y:  centerY + radius))
        p.addLine(to: CGPoint(x: centerX - radius, y:  centerY))
        p.addLine(to: CGPoint(x: centerX , y:  centerY - radius))
        p.addLine(to: CGPoint(x: centerX + radius , y:  centerY ))
        
        return p
    }
}
