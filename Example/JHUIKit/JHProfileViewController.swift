//
//  JHProfileViewController.swift
//  JHUIKit
//
//  Created by Huan Jiang on 5/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import JHUIKit

class JHProfileViewController: UIViewController, JHSwipeViewDelegate {
    
    let runtimeConstants = RuntimeConstants()
    var personView: JHProfileCardView?
    override func viewDidLoad() {
        super.viewDidLoad()
        addPersonCard()
        handleNotification()
    }
    
    func addPersonCard()
    {
        let superView = UIView(frame: CGRectMake(runtimeConstants.CardMarginWidth, self.runtimeConstants.CardTop, self.runtimeConstants.CardWidth, runtimeConstants.AdaptiveCardHeight))
        personView = JHProfileCardView(frame: superView.bounds, image: UIImage(named: "mask")!, radius: 200)
        personView!.swipeViewDelegate = self
        superView.addSubview(personView!)
        self.view.addSubview(superView);
    }
    
    func handleNotification()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHProfileViewController.cardSwiped(_:)), name: "CardSwipedNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHProfileViewController.cardLikeOrDislike(_:)), name: "CardLikeOrDislikeNotification", object: nil)
    }
    
    func cardSwiped(notification: NSNotification)
    {
        if let _: NSDictionary = notification.userInfo
        {
//            let swipe_action:String = info["swipe_action"] as! String
//            var isLike: Int = swipe_action == "like" ? 1 : 0
        }
        
        self.personView!.removeFromSuperview()
        NSLog("PersonCard.Notification:jobCardSwiped ")
        self.addPersonCard()
    }
    
    func cardLikeOrDislike(notification: NSNotification)
    {
        if let _: NSDictionary = notification.userInfo
        {
//            let action:String = info["action"] as! String
//            var isLike: Int = action == "like" ? 1 : 0
        }
        self.addPersonCard()
    }
    
    func cardUsedUp() {
        
    }
    
    func cardSwiped(liked: Bool, viewSwiped:UIView) {
        
    }
    
    func addNextCard() {
        
    }
}