//
//  SwiftUIView.swift
//  
//
//  Created by Jung Tae Cha on 6/28/24.
//

import SwiftUI

@available(iOS 14, macOS 11.0, *)
struct ProgressLoading: View {
    
    // A binding to track the progress value
    @Binding var progress: CGFloat
    
    // The color of the progress bar
    var color: Color = .black
    
    // The background color of the progress bar
    var backgroundColor: Color = .white
    
    // The style of the progress bar (Capsule or Rectangle)
    var type: ProgressViewStyle = .Capsule
    
    // Initializer to set the progress value
    init(progress: Binding<CGFloat>) {
        _progress = progress
    }
    
    // Initializer to set the progress value and the style of the progress bar
    init(progress: Binding<CGFloat>, type: ProgressViewStyle) {
        _progress = progress
        self.type = type
    }
    
    // Initializer to set the progress value, style, bar color, and background color
    init(progress: Binding<CGFloat>, type: ProgressViewStyle, barcolor: Color, backgroundColor: Color) {
        _progress = progress
        self.type = type
        self.color = barcolor
        self.backgroundColor = backgroundColor
    }
    
    // Initializer to set the progress value, bar color, and background color
    init(progress: Binding<CGFloat>, barcolor: Color, backgroundColor: Color) {
        _progress = progress
        self.color = barcolor
        self.backgroundColor = backgroundColor
    }
    
    // The body of the View
    var body: some View {
        // Display a Capsule or Rectangle based on the type
        if type == .Capsule {
            Capsule()
                .foregroundColor(backgroundColor)
                .overlay(
                    GeometryReader { res in
                        Capsule()
                            .frame(width: progress >= 1 ? res.size.width : getProgress(width: res.size.width))
                            .foregroundColor(color)
                    }
                )
                .shadow(radius: 1)
        } else {
            Rectangle()
                .foregroundColor(backgroundColor)
                .overlay(
                    GeometryReader { res in
                        Rectangle()
                            .frame(width: progress >= 1 ? res.size.width : getProgress(width: res.size.width))
                            .foregroundColor(color)
                    }
                )
                .shadow(radius: 1)
        }
    }
    
    // A function to calculate the progress width based on the container width
    func getProgress(width: CGFloat) -> CGFloat {
        print(width * progress)
        return width * progress
    }
}




@available(iOS 14, macOS 11.0, *)
#Preview {
    ProgressLoading(progress: .constant(0.4)).frame(height: 20).padding()
}
