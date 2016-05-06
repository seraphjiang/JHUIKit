//
//  ViewController.swift
//  JHUIKit
//
//  Created by jianghuan on 05/05/2016.
//  Copyright (c) 2016 jianghuan. All rights reserved.
//

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

