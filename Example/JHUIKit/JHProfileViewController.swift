//
//  JHProfileViewController.swift
//  JHUIKit
//
//  Created by Huan Jiang on 5/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import JHUIKit
class JHProfileViewController: UIViewController {
    let runtimeConstants = RuntimeConstants()

    override func viewDidLoad() {
        super.viewDidLoad()
        addPersonCard()
    }
    
    func addPersonCard()
    {
        let superView = UIView(frame: CGRectMake(runtimeConstants.CardMarginWidth, self.runtimeConstants.CardTop, self.runtimeConstants.CardWidth, runtimeConstants.AdaptiveCardHeight))
        let personView = JHProfileCardView(frame: superView.bounds, image: UIImage(named: "mask")!)
        superView.addSubview(personView)
        self.view.addSubview(superView);
    }
}