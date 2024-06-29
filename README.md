# SwiftUI Loading Views

[![SwiftUI 2.0](https://img.shields.io/badge/SwiftUI-2.0-orange)](https://developer.apple.com/xcode/swiftui/)
[![iOS](https://img.shields.io/badge/iOS-14.0-blue)](https://developer.apple.com/ios/)
[![MIT License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

A collection of customizable loading indicators for SwiftUI.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [CircleLoading](#circleloading)
  - [CircleTrimLoading](#circletrimloading)
  - [ProgressLoading](#progressloading)
  - [RectangleLoading](#rectangleloading)
- [License](#license)
- [Contact](#contact)

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/chonte0313/SwiftUILoadingViews.git", from: "1.0.0")
]
```
Or add the package directly through Xcode:

1. Open your project in Xcode.
2. Navigate to **File > Swift Packages > Add Package Dependency...**.
3. Enter the repository URL: `https://github.com/chonte0313/SwiftUILoadingViews.git`.
4. Select the version you want to install.
5. Add the package to your project.

## Usage

### CircleLoading

A circular loading indicator that continuously rotates.

#### Initializers

- init(speed: Speed): Creates a CircleLoading with the specified speed.
- init(speed: Speed, lineWidth: CGFloat): Creates a CircleLoading with the specified speed and line width.
- init(speed: Speed, lineWidth: CGFloat, lineCap: CGLineCap): Creates a CircleLoading with the specified speed, line width, and line cap style.


Example

```swift
CircleLoading(speed: .medium)
    .frame(width: 50, height: 50)
    .foregroundColor(.blue)
```



### CircleTrimLoading

A circular loading indicator with a trimming effect.

#### Initializers

- init(): Creates a CircleTrimLoading with default settings.
- init(speed: Speed): Creates a CircleTrimLoading with the specified speed.
- init(speed: Speed, lineWidth: CGFloat): Creates a CircleTrimLoading with the specified speed and line width.
- init(speed: Speed, lineCap: CGLineCap): Creates a CircleTrimLoading with the specified speed and line cap style.
- init(speed: Speed, lineWidth: CGFloat, lineCap: CGLineCap): Creates a CircleTrimLoading with the specified speed, line width, and line cap style.

Example

```swift
CircleTrimLoading()
    .frame(width: 50, height: 50)
    .foregroundColor(.purple)
```



### ProgressLoading

A customizable progress bar with different styles.

#### Initializers

- init(progress: Binding<CGFloat>): Creates a ProgressLoading with the specified progress binding.
- init(progress: Binding<CGFloat>, type: ProgressViewStyle): Creates a ProgressLoading with the specified progress binding and style.
- init(progress: Binding<CGFloat>, type: ProgressViewStyle, barcolor: Color, backgroundColor: Color): Creates a ProgressLoading with the specified progress binding, style, bar color, and background color.
- init(progress: Binding<CGFloat>, barcolor: Color, backgroundColor: Color): Creates a ProgressLoading with the specified progress binding, bar color, and background color.

Example

```swift
@State private var progress: CGFloat = 0.5

ProgressLoading(progress: $progress)
    .frame(width: 200, height: 20)

```

### RectangleLoading

A rectangular loading indicator with a trimming effect.

#### Initializers

- init(): Creates a RectangleLoading with default settings.
- init(speed: Speed): Creates a RectangleLoading with the specified speed.
- init(speed: Speed, lineWidth: CGFloat): Creates a RectangleLoading with the specified speed and line width.
- init(speed: Speed, lineCap: CGLineCap): Creates a RectangleLoading with the specified speed and line cap style.
- init(speed: Speed, lineWidth: CGFloat, lineCap: CGLineCap): Creates a RectangleLoading with the specified speed, line width, and line cap style.

Example

```swift
RectangleLoading()
    .frame(width: 50, height: 50)
    .foregroundColor(.blue)
```



###License

```This package is licensed under the MIT License. See the LICENSE file for more information.```

Made with ❤️ by chonte0313 | Contact: [your email]
