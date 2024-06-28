<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<body>

<h1>SwiftUI Loading Views</h1>

<p>
    <a href="https://developer.apple.com/xcode/swiftui/">
        <img src="https://img.shields.io/badge/SwiftUI-2.0-orange" alt="SwiftUI 2.0">
    </a>
    <a href="https://developer.apple.com/ios/">
        <img src="https://img.shields.io/badge/iOS-14.0-blue" alt="iOS 14.0">
    </a>
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT License">
    </a>
</p>

<p class="center">A collection of customizable loading indicators for SwiftUI.</p>

<h2>Table of Contents</h2>

<ul>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#usage">Usage</a>
        <ul>
            <li><a href="#circleloading">CircleLoading</a></li>
            <li><a href="#circletrimloading">CircleTrimLoading</a></li>
            <li><a href="#progressloading">ProgressLoading</a></li>
            <li><a href="#rectangleloading">RectangleLoading</a></li>
        </ul>
    </li>
    <li><a href="#enums">Enums</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#example-project">Example Project</a></li>
    <li><a href="#contact">Contact</a></li>
</ul>

<h2 id="installation">Installation</h2>

<p>Add SwiftUI Loading Views to your Swift project via Swift Package Manager:</p>

<pre><code>dependencies: [
    .package(url: "https://github.com/yourusername/SwiftUILoadingViews.git", from: "1.0.0")
]
</code></pre>

<p>Or add the package directly through Xcode:</p>

<ol>
    <li>Open your project in Xcode.</li>
    <li>Navigate to <code>File</code> &gt; <code>Swift Packages</code> &gt; <code>Add Package Dependency...</code>.</li>
    <li>Enter the repository URL: <code>https://github.com/chonte0313/SwiftUILoadingViews.git</code>.</li>
    <li>Select the version you want to install.</li>
    <li>Add the package to your project.</li>
</ol>

<h2 id="usage">Usage</h2>

<h3 id="circleloading">CircleLoading</h3>

<p>A circular loading indicator that continuously rotates.</p>

<h4>Properties</h4>

<ul>
    <li><code>lineWidth: CGFloat</code>: The width of the circular stroke. Default is <code>5</code>.</li>
    <li><code>angle: Double</code>: The rotation angle of the circle.</li>
    <li><code>timer: Publishers.Autoconnect&lt;Timer.TimerPublisher&gt;</code>: A timer that triggers updates to the rotation angle.</li>
    <li><code>lineCap: CGLineCap</code>: The style of the line's end point. Default is <code>.square</code>.</li>
</ul>

<h4>Initializers</h4>

<pre><code>CircleLoading(speed: .medium)
CircleLoading(speed: .fast, lineWidth: 10)
CircleLoading(speed: .slow, lineWidth: 8, lineCap: .round)
</code></pre>

<h4>Usage</h4>

<pre><code>CircleLoading(speed: .medium)
    .frame(width: 50, height: 50)
    .foregroundColor(.blue)

CircleLoading(speed: .fast, lineWidth: 10)
    .frame(width: 60, height: 60)
    .foregroundStyle(.red)

CircleLoading(speed: .slow, lineWidth: 8, lineCap: .round)
    .frame(width: 40, height: 40)
    .foregroundColor(.green)
</code></pre>

<h3 id="circletrimloading">CircleTrimLoading</h3>

<p>A circular loading indicator with a trimming effect.</p>

<h4>Properties</h4>

<ul>
    <li><code>startTrim: CGFloat</code>: The start point of the trim. Default is <code>0</code>.</li>
    <li><code>endTrim: CGFloat</code>: The end point of the trim. Default is <code>0.1</code>.</li>
    <li><code>lineWidth: CGFloat</code>: The width of the circular stroke. Default is <code>5</code>.</li>
    <li><code>angle: Double</code>: The rotation angle of the circle.</li>
    <li><code>timer: Publishers.Autoconnect&lt;Timer.TimerPublisher&gt;</code>: A timer that triggers updates to the trim.</li>
    <li><code>counter: Int</code>: A counter to track the number of timer events.</li>
    <li><code>lineCap: CGLineCap</code>: The style of the line's end point. Default is <code>.square</code>.</li>
</ul>

<h4>Initializers</h4>

<pre><code>CircleTrimLoading()
CircleTrimLoading(speed: .fast)
CircleTrimLoading(speed: .slow, lineWidth: 10)
CircleTrimLoading(speed: .medium, lineCap: .round)
CircleTrimLoading(speed: .fast, lineWidth: 8, lineCap: .round)
</code></pre>

<h4>Usage</h4>

<pre><code>CircleTrimLoading()
    .frame(width: 50, height: 50)
    .foregroundColor(.purple)

CircleTrimLoading(speed: .fast)
    .frame(width: 60, height: 60)
    .foregroundStyle(.orange)

CircleTrimLoading(speed: .slow, lineWidth: 10)
    .frame(width: 40, height: 40)
    .foregroundColor(.pink)

CircleTrimLoading(speed: .medium, lineCap: .round)
    .frame(width: 50, height: 50)
    .foregroundStyle(.cyan)

CircleTrimLoading(speed: .fast, lineWidth: 8, lineCap: .round)
    .frame(width: 60, height: 60)
    .foregroundColor(.yellow)
</code></pre>

<h3 id="progressloading">ProgressLoading</h3>

<p>A customizable progress bar with different styles.</p>

<h4>Properties</h4>

<ul>
    <li><code>progress: Binding&lt;CGFloat&gt;</code>: A binding to track the progress value.</li>
    <li><code>color: Color</code>: The color of the progress bar. Default is <code>.black</code>.</li>
    <li><code>backgroundColor: Color</code>: The background color of the progress bar. Default is <code>.white</code>.</li>
    <li><code>type: ProgressViewStyle</code>: The style of the progress bar. Default is <code>.Capsule</code>.</li>
</ul>

<h4>Initializers</h4>

<pre><code>@State private var progress: CGFloat = 0.5

ProgressLoading(progress: $progress)
ProgressLoading(progress: $progress, type: .Rectangle)
ProgressLoading(progress: $progress, type: .Capsule, barcolor: .blue, backgroundColor: .gray)
ProgressLoading(progress: $progress, barcolor: .green, backgroundColor: .black)
</code></pre>

<h4>Usage</h4>

<pre><code>@State private var progress: CGFloat = 0.5

ProgressLoading(progress: $progress)
    .frame(width: 200, height: 20)

ProgressLoading(progress: $progress, type: .Rectangle)
    .frame(width: 200, height: 20)

ProgressLoading(progress: $progress, type: .Capsule, barcolor: .blue, backgroundColor: .gray)
    .frame(width: 200, height: 20)

ProgressLoading(progress: $progress, barcolor: .green, backgroundColor: .black)
    .frame(width: 200, height: 20)
</code></pre>

<h3 id="rectangleloading">RectangleLoading</h3>

<p>A rectangular loading indicator with a trimming effect.</p>

<h4>Properties</h4>

<ul>
    <li><code>startTrim: CGFloat</code>: The start point of the trim. Default is <code>0</code>.</li>
    <li><code>endTrim: CGFloat</code>: The end point of the trim. Default is <code>0.1</code>.</li>
    <li><code>lineWidth: CGFloat</code>: The width of the rectangular stroke. Default is <code>5</code>.</li>
    <li><code>angle: Double</code>: The rotation angle of the rectangle (unused in this implementation).</li>
    <li><code>timer: Publishers.Autoconnect&lt;Timer.TimerPublisher&gt;</code>: A timer that triggers updates to the trim.</li>
    <li><code>counter: Int</code>: A counter to track the number of timer events.</li>
    <li><code>lineCap: CGLineCap</code>: The style of the line's end point. Default is <code>.square</code>.</li>
</ul>

<h4>Initializers</h4>

<pre><code>RectangleLoading()
RectangleLoading(speed: .fast)
RectangleLoading(speed: .slow, lineWidth: 10)
RectangleLoading(speed: .medium, lineCap: .round)
RectangleLoading(speed: .fast, lineWidth: 8, lineCap: .round)
</code></pre>

<h4>Usage</h4>

<pre><code>RectangleLoading()
    .frame(width: 50, height: 50)
    .foregroundColor(.blue)

RectangleLoading(speed: .fast)
    .frame(width: 60, height: 60)
    .foregroundStyle(.red)

RectangleLoading(speed: .slow, lineWidth: 10)
    .frame(width: 40, height: 40)
    .foregroundColor(.green)

RectangleLoading(speed: .medium, lineCap: .round)
    .frame(width: 50, height: 50)
    .foregroundStyle(.purple)

RectangleLoading(speed: .fast, lineWidth: 8, lineCap: .round)
    .frame(width: 60, height: 60)
    .foregroundColor(.orange)
</code></pre>

<h2 id="enums">Enums</h2>

<h3>Speed</h3>

<p>Defines the speeds for the timer.</p>

<pre><code>enum Speed: Double {
    case slow = 0.03   // Slow speed for the timer
    case medium = 0.01 // Medium speed for the timer
    case fast = 0.005  // Fast speed for the timer
}
</code></pre>

<h3>ProgressViewStyle</h3>

<p>Defines the styles of the progress view.</p>

<pre><code>enum ProgressViewStyle {
    case Rectangle // Rectangle style for the progress view
    case Capsule   // Capsule style for the progress view
}
</code></pre>

<h2 id="license">License</h2>

<p>This package is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for more information.</p>

<hr>

<p class="center">
    <a href="https://github.com/chonte0313/SwiftUILoadingViews/issues">Report Bug</a> ·
    <a href="https://github.com/chonte0313/SwiftUILoadingViews/issues">Request Feature</a>
</p>

<h2 id="example-project">Example Project</h2>

<p>To see these views in action, you can refer to the example project included in this repository. Clone the repository and open the example project in Xcode to explore the usage of each loading view.</p>

<pre><code>git clone https://github.com/yourusername/SwiftUILoadingViews.git
cd SwiftUILoadingViews/Example
open Example.xcodeproj
</code></pre>

<p>Feel free to modify the example project to test different configurations and styles of the loading views.</p>

<hr>

<p class="center">Made with ❤️ by [your name] | Contact: [your email]</p>

</body>
</html>
