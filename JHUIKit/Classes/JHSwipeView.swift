//
//  JHSwipeView.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//
//

import UIKit

/// A tinder like swipe-able view
public class JHSwipeView: UIView {
    
    /// delegate for controller to subscripe swipe gesture event
    public var swipeViewDelegate: JHSwipeViewDelegate?  // weak to prevent retain cycles
    
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var lastOriginLocation:CGPoint = CGPointMake(0, 0)
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var cardWidth :CGFloat = 382.0  // iPhone6P : cardWidth
    
    let runtimeConstants = RuntimeConstants()
        
    var checkImageView:UIImageView?
    var closeImageView:UIImageView?
    
    /**
     init view with gesture support
     
     - parameter frame: CGRect for size and position
     
     */
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
        self.initView()
    }
    
    /**
     init will be invoked when view is init by storyboard
     
     - parameter aDecoder:
     
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
    
    /**
     Add nice border to view
     */
    public func applyBorder()
    {
        // set Border outside
        let borderWidth = 0.5;
        let borderView = UIView()
        borderView.frame = CGRectInset(self.frame, CGFloat(borderWidth), 0)
        borderView.backgroundColor = UIColor.clearColor()
        borderView.layer.cornerRadius = 12; // if you like rounded corners
        borderView.layer.borderColor = UIColor.lightGrayColor().CGColor
        borderView.layer.borderWidth = CGFloat(borderWidth)
//        borderView.layer.masksToBounds = true;
        self.addSubview(borderView)
        self.bringSubviewToFront(borderView)
    }
    
    
    public override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        // todo todo todo
        self.lastOriginLocation = touch.previousLocationInView(self.superview)
    }
    
    /**
     init view with gesture and backgroud
     
     */
    func initView() {
        self.applyGesture()
        self.backgroundColor = UIColor.whiteColor()
        self.alpha = 1
    }
    
    /**
     add pan gesture to support swipe
     */
    func applyGesture()
    {
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(JHSwipeView.handlePan(_:)))
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        self.addGestureRecognizer(panRecognizer)
    }
    
    func handlePan(recognizer:UIPanGestureRecognizer) {
        let v = recognizer.view!;
        let translation  = recognizer.translationInView(self.superview!)
        let loc = recognizer.locationInView(self.superview)
        _ = abs(Int(Float(loc.x)))
        _ = Int(Float(lastOriginLocation.x))
        
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        //        self.superview?.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        NSLog("last x,y:\(lastLocation.x),\(lastLocation.y);  center x,y:\(self.center.x),\(self.center.y)")
        
        //rotationRadians
        let tanY = Double(translation.x);
        let tanX = Double(screenSize.height) - Constants.CardTop
        
        // arctan
        let rotationRadians = atan2(tanY,tanX)
        self.layer.transform = RotationTransform(rotationRadians, offset: 20.0)
        
        var alpha = abs(tanY/tanX) * 3 + 0.2
        alpha = alpha < 1 ? alpha : 1
        NSLog("alpha/tan:\(alpha)")
        if(translation.x > 0)
        {
            self.closeImageView?.alpha = 0
            self.checkImageView?.alpha = CGFloat(alpha)
        }
        else
        {
            self.checkImageView?.alpha = 0
            self.closeImageView?.alpha = CGFloat(alpha)
        }
        var isSwiped = false
        var isSwipelike = false
        _ = Int(self.screenSize.width/2)
        
        if(recognizer.state == UIGestureRecognizerState.Ended)
        {
            if (alpha > Constants.SwipeThreshold)
            {
                NSLog("Start to simulate swipe")
                UIView.animateWithDuration(
                    0.3,
                    animations:{
                        if(translation.x < 0)
                        {
                            isSwiped = true
                            NSLog("loc left than prev, Swipe to left for dislike")
                            v.frame.origin.x = -1 * (self.screenSize.width + 150)
                            self.checkImageView?.alpha = 1
                        }
                        else if(translation.x > 0)
                        {
                            isSwiped = true
                            NSLog("loc right than prev, Swipe to right for like")
                            v.frame.origin.x = CGFloat(self.screenSize.width + 150)
                            self.closeImageView?.alpha = 1
                            isSwipelike = true
                        }
                        else
                        {
                            isSwiped = false
                            NSLog("not moving at all")
                        }
                    },
                    completion: { finished in
                        // don't move self.delegate code to above animation enclosure, otherwise card will be removed before animation finished
                        if(isSwiped)
                        {
                            self.swipeViewDelegate?.cardSwiped(true, viewSwiped: self)
                        }
                        NSNotificationCenter.defaultCenter().postNotificationName(Constants.CardSwipedNotification, object: nil, userInfo: ["swipe_action": isSwipelike ? "like" : "dislike"] as NSDictionary as [NSObject : AnyObject])
                        
                        NSLog("Notice ViewController")
                })
            }
            else
            {           // reset state
                UIView.animateWithDuration(0.5, animations: {
                    self.center = self.lastLocation
                    self.transform = CGAffineTransformIdentity
                    self.closeImageView?.alpha = 0
                    self.checkImageView?.alpha = 0
                })
                
            }
        }
    }
    
    func moveOutFromSuperview(like: Bool)
    {
        UIView.animateWithDuration(
            0.5,
            animations:{
                if(like)
                {
                    self.frame.origin.x = (self.screenSize.width + 150)
                    self.checkImageView?.alpha = 1
                }
                else
                {
                    self.frame.origin.x = -1 * CGFloat(self.screenSize.width + 150)
                    self.closeImageView?.alpha = 1
                }
            },
            completion: { finished in
                NSLog("Add next card")
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.CardLikeOrDislikeNotification, object: nil, userInfo: ["action": like ? "like" : "dislike"] as NSDictionary as [NSObject : AnyObject])
        })
    }
    
    func RotationTransform(rotationRadians: Double, offset: Double) -> CATransform3D {
        _ = CGPointMake(CGFloat(-1 * offset), CGFloat(-1 * offset))
        var startTransform = CATransform3DIdentity
        startTransform = CATransform3DRotate(CATransform3DIdentity,
                                             CGFloat(rotationRadians), 0.0, 0.0, 1.0)
        startTransform = CATransform3DTranslate(startTransform, 0, 0, 0.0)
        return startTransform
    }
    
    func addCheckAndCloseIcon(left:CGFloat, top:CGFloat)
    {
        checkImageView = UIImageView()
        checkImageView?.frame = CGRectMake(left, top, 192, 192)
        
        let checkImage = UIImage(named: "Yes")
        checkImageView?.image = checkImage
        checkImageView?.tintColor = UIColor.greenColor();
        checkImageView?.alpha = 0
        self.addSubview(checkImageView!)
        
        closeImageView = UIImageView()
        closeImageView?.frame = CGRectMake(left, top, 192, 192)
        let closeImage = UIImage(named: "circle_close_delete")
        self.closeImageView?.image = closeImage
        closeImageView?.tintColor = UIColor.redColor();
        closeImageView?.alpha = 0
        self.addSubview(closeImageView!)
    }
    
    func showMessage()
    {
        let message = UIAlertView(title: "Hello", message:"world", delegate:nil, cancelButtonTitle:"OK")
        message.show()
    }
}
