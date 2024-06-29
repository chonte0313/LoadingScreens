//
//  SwiftUIView.swift
//  
//
//  Created by Jung Tae Cha on 6/28/24.
//

import SwiftUI
import Combine

@available(iOS 14, macOS 11.0, *)
public struct RectangleLoading: View {
    
    // State variables to track the start and end points of the trim
    @State var startTrim: CGFloat = 0
    @State var endTrim: CGFloat = 0.1
    
    // The width of the rectangular stroke
    var lineWidth: CGFloat = 5
    
    // A state variable to track the rotation angle of the rectangle (unused in this implementation)
    @State var angle: Double = 0
    
    // A timer that triggers updates to the trim
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    // A state variable to track the number of timer events
    @State var counter = 0
    
    // The style of the line's end point
    var lineCap = CGLineCap.square
    
    // Default initializer with a medium speed timer
    init() {
        timer = Timer.publish(every: Speed.medium.rawValue, on: .main, in: .common).autoconnect()
    }
    
    // Initializer to set the speed of the animation
    init(speed: Speed) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
    }
    
    // Initializer to set the speed of the animation and the line width
    init(speed: Speed, lineWidth: CGFloat) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
        self.lineWidth = lineWidth
    }
    
    // Initializer to set the speed of the animation and the line cap style
    init(speed: Speed, lineCap: CGLineCap) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
        self.lineCap = lineCap
    }
    
    // Initializer to set the speed of the animation, line width, and line cap style
    init(speed: Speed, lineWidth: CGFloat, lineCap: CGLineCap) {
        timer = Timer.publish(every: speed.rawValue, on: .main, in: .common).autoconnect()
        self.lineWidth = lineWidth
        self.lineCap = lineCap
    }
    
    // The body of the View
    var body: some View {
        // Draw a rounded rectangle that is trimmed and styled
        RoundedRectangle(cornerRadius: 10)
            .trim(from: startTrim, to: endTrim)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
            .onReceive(timer) { _ in
                // Update the trim on each timer event
                startTimer()
            }
            .rotationEffect(.degrees(180)) // Rotate the rectangle by 180 degrees
    }
    
    // A function to update the trim values
    func startTimer() {
        if endTrim <= 1 {
            // Increase the end trim value with animation
            withAnimation {
                endTrim += 0.01
            }
        } else if startTrim <= 1 {
            // Increase the start trim value with animation
            withAnimation {
                startTrim += 0.01
            }
        } else {
            // Reset the trim values and the counter after 50 timer events
            counter += 1
            if counter > 50 {
                startTrim = 0
                endTrim = 0
                counter = 0
            }
        }
    }
}

@available(iOS 14, macOS 11.0, *)
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoading(speed: .medium, lineWidth: 10, lineCap: .round).frame(width: 60,height: 40).padding().tag("Circle Loading")
        CircleTrimLoading(speed: .fast, lineWidth: 10, lineCap: .round).padding()
        ProgressLoading(progress: .constant(20)).frame(height: 20).padding()
        RectangleLoading(speed: .medium).frame(width: 60,height: 40).padding()
    }
}
