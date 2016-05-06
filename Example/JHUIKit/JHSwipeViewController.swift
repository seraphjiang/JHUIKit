//
//  JHSwipeViewController.swift
//  JHUIKit
//
//  Created by Huan Jiang on 5/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import JHUIKit

class JHSwipeViewController: UIViewController {
    
    let runtimeConstants = RuntimeConstants()
    override func viewDidLoad() {
        super.viewDidLoad()

        let superView = UIView(frame: CGRectMake(runtimeConstants.CardMarginWidth, self.runtimeConstants.CardTop, self.runtimeConstants.CardWidth, runtimeConstants.AdaptiveCardHeight))
        
        let cardView = JHSwipeView(frame: superView.bounds)
        cardView.applyBorder()
        superView.addSubview(cardView)
        self.view.addSubview(superView);
    }
}
