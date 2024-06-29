//
//  File.swift
//  
//
//  Created by Jung Tae Cha on 6/28/24.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 14, macOS 11.0, *)
public struct CircleLoading : View {
    
    // The width of the circular stroke
    var lineWidth : CGFloat = 5
    
    // A state variable to track the rotation angle of the circle
    @State var angle : Double = 0
    
    // A timer that triggers updates to the rotation angle
    let timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    // The style of the line's end point
    var lineCap = CGLineCap.square
    
    // Initializer to set the speed of the animation
    public init(speed: Speed) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
    }
    
    // Initializer to set the speed of the animation and the line width
    public init(speed: Speed, lineWidth: CGFloat) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
        self.lineWidth = lineWidth
    }
    
    // Initializer to set the speed of the animation, line width, and line cap style
    public init(speed: Speed, lineWidth: CGFloat, lineCap: CGLineCap) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
        self.lineWidth = lineWidth
        self.lineCap = lineCap
    }
    
    // The body of the View
    public var body: some View {
        // Draw a circle that is trimmed and styled
        Circle()
            .trim(from: 0, to: 0.75)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
            .rotationEffect(Angle(degrees: angle)) // Rotate the circle based on the angle
            .onReceive(timer) { _ in
                // Update the angle on each timer event
                angle += 1
            }
    }
}
