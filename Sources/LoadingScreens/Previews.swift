//
//  File.swift
//  
//
//  Created by Jung Tae Cha on 6/28/24.
//

import Foundation
import SwiftUI


///Previews
@available(iOS 14, macOS 11.0, *)
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoading(speed: .medium, lineWidth: 10, lineCap: .round).frame(width: 60,height: 40).foregroundColor(.blue).padding().tag("Circle Loading")
        CircleTrimLoading(speed: .fast, lineWidth: 10, lineCap: .round).padding().foregroundColor(.blue).frame(width: 80,height: 80)
        ProgressLoading(progress: .constant(0.3)).frame(height: 20).padding()
        RectangleLoading(speed: .medium).frame(width: 60,height: 40).padding().foregroundColor(.blue)
    }
}

