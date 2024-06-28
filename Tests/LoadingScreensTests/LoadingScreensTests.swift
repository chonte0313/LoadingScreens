import XCTest
import SwiftUI
@testable import LoadingScreens


@available(iOS 14, macOS 11.0, *)
final class LoadingScreensTests: XCTestCase {
    // Tests the initialization of CircleLoading with medium speed.
        func testCircleLoadingInitialization() {
            let circleLoading = CircleLoading(speed: .medium)
            XCTAssertNotNil(circleLoading)
        }
        
        // Tests that the angle increases after the timer triggers in CircleLoading.
        func testCircleLoadingAngleIncrement() {
            let circleLoading = CircleLoading(speed: .fast)
            let initialAngle = circleLoading.angle
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                XCTAssertGreaterThan(circleLoading.angle, initialAngle)
            }
        }
        
        // MARK: - CircleTrimLoading Tests
        
        // Tests the initialization of CircleTrimLoading.
        func testCircleTrimLoadingInitialization() {
            let circleTrimLoading = CircleTrimLoading()
            XCTAssertNotNil(circleTrimLoading)
        }
        
        // Tests the trimming effect after the timer starts in CircleTrimLoading.
        func testCircleTrimLoadingTrimming() {
            let circleTrimLoading = CircleTrimLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                XCTAssertGreaterThan(circleTrimLoading.startTrim, 0.01)
                XCTAssertGreaterThan(circleTrimLoading.endTrim, 0.11)
            }
        }
        
        // MARK: - ProgressLoading Tests
        
        // Tests the initialization of ProgressLoading with a progress binding.
        func testProgressLoadingInitialization() {
            let progressLoading = ProgressLoading(progress: .constant(0.5))
            XCTAssertNotNil(progressLoading)
        }
        
        // Tests that the progress value updates correctly when modified in ProgressLoading.
        func testProgressLoadingProgressUpdate() {
            var progress : CGFloat = 0.2
            let progressLoading = ProgressLoading(progress: Binding(get: {return progress}, set: {progress = $0}))
            XCTAssertEqual(progress, 0.2)
            progress = 0.8
            XCTAssertEqual(progress, 0.8)
        }
        
        // MARK: - RectangleLoading Tests
        
        // Tests the initialization of RectangleLoading.
        func testRectangleLoadingInitialization() {
            let rectangleLoading = RectangleLoading()
            XCTAssertNotNil(rectangleLoading)
        }
        
        // Tests the trimming effect after the timer starts in RectangleLoading.
        func testRectangleLoadingTrimming() {
            let rectangleLoading = RectangleLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                XCTAssertGreaterThan(rectangleLoading.startTrim, 0.01)
                XCTAssertGreaterThan(rectangleLoading.endTrim, 0.11)
            }
        }
        
}
