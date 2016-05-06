//
//  RuntimeConstants.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//
//

import UIKit

public class RuntimeConstants: NSObject {
    
    public let CardMargin: CGFloat = 16.0
    public let CardMarginWidth: CGFloat = 16.0
    public let CardPaddingWidth: CGFloat = 20.0
    
    public let ScreenHeight: CGFloat
    public let ScreenWidth: CGFloat
    public let ScreenSize: CGRect = UIScreen.mainScreen().bounds
    
    public let CardLeft :CGFloat = 16.0
    public let CardTop :CGFloat = 90.0
    public let CardWidth :CGFloat
    public let CardHeight :CGFloat = 500.0 // iPhone6 Plus
    public let AdaptiveCardHeight :CGFloat
    
    public let OneThirdWidth : CGFloat
    
    public let FirstOfThreeLeft: CGFloat = 0.0
    public let SecondOfThreeLeft: CGFloat
    public let ThirdOfThreeLeft: CGFloat
    
    public let HorizontalLineWidthWithPadding: CGFloat
    
    
    public let UIBarHeight: CGFloat = 50
    
    public override init()
    {
        self.ScreenHeight = ScreenSize.height
        self.ScreenWidth = ScreenSize.width
        self.CardWidth = self.ScreenWidth - self.CardMarginWidth * 2
        
        self.HorizontalLineWidthWithPadding = self.CardWidth - self.CardPaddingWidth * 2
        
        self.OneThirdWidth = (self.CardWidth - 2) / 3
        self.SecondOfThreeLeft = OneThirdWidth + 2
        self.ThirdOfThreeLeft = self.SecondOfThreeLeft + OneThirdWidth + 2
        
        self.AdaptiveCardHeight = ScreenHeight - CardTop - self.CardMarginWidth - UIBarHeight
    }
}
