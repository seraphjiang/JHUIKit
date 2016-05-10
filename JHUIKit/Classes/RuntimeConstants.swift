//
//  RuntimeConstants.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//
//

import UIKit

/// Runtime Constants
public class RuntimeConstants: NSObject {
    
    /// card margin
    public let CardMargin: CGFloat = 16.0
    
    /// Card Margin Width
    public let CardMarginWidth: CGFloat = 16.0
    
    /// Card Padding Width
    public let CardPaddingWidth: CGFloat = 20.0
    
    /// Screen Height
    public let ScreenHeight: CGFloat
    
    /// Screen Width
    public let ScreenWidth: CGFloat
    
    /// Screen Size
    public let ScreenSize: CGRect = UIScreen.mainScreen().bounds
    
    /// Card Top
    public let CardTop :CGFloat = 90.0
    
    /// Card Width
    public let CardWidth :CGFloat
    
    /// Card Height
    public let CardHeight :CGFloat = 500.0 // iPhone6 Plus
    
    /// Card Height
    public let AdaptiveCardHeight :CGFloat
    
    /// UIBar Height
    public let UIBarHeight: CGFloat = 50
    
    public override init()
    {
        self.ScreenHeight = ScreenSize.height
        self.ScreenWidth = ScreenSize.width
        self.CardWidth = self.ScreenWidth - self.CardMarginWidth * 2
        
        self.AdaptiveCardHeight = ScreenHeight - CardTop - self.CardMarginWidth - UIBarHeight
    }
}
