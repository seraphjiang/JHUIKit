# JHUIKit

[![CI Status](http://img.shields.io/travis/jianghuan/JHUIKit.svg?style=flat)](https://travis-ci.org/jianghuan/JHUIKit)
[![Version](https://img.shields.io/cocoapods/v/JHUIKit.svg?style=flat)](http://cocoapods.org/pods/JHUIKit)
[![License](https://img.shields.io/cocoapods/l/JHUIKit.svg?style=flat)](http://cocoapods.org/pods/JHUIKit)
[![Platform](https://img.shields.io/cocoapods/p/JHUIKit.svg?style=flat)](http://cocoapods.org/pods/JHUIKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
XCode

## Installation

JHUIKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JHUIKit"
```

```Swift
// How to use JHSwipeView
import UIKit
import JHUIKit

class ViewController: UIViewController {
let runtimeConstants = RuntimeConstants()

override func viewDidLoad() {
super.viewDidLoad()

let superView = UIView(frame: CGRectMake(runtimeConstants.CardMarginWidth, self.runtimeConstants.CardTop, self.runtimeConstants.CardWidth, runtimeConstants.AdaptiveCardHeight))

let cardView = JHSwipeView(frame: superView.bounds)

superView.addSubview(cardView)
self.view.addSubview(superView);
}
}
```

## Author

jianghuan, seraphjiang@gmail.com

## License

JHUIKit is available under the MIT license. See the LICENSE file for more info.

* JHCircleImageView, show image view with a circle mask. widely used to render avatar of user.
* JHSwipeView, base view to support tinder style swipe-able(left/right) card style view.