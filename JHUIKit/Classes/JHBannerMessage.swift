//
//  JHBannerMessage.swift
//  Pods
//
//  Created by Huan Jiang on 5/7/16.
//
//

import UIKit

public class JHBannerMessage: NSObject {
    public static func show(message: String) -> Void {
        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            let alertView = UIView(frame: CGRectMake(0, -80, RuntimeConstants().ScreenWidth, 80))
            alertView.backgroundColor = UIColor.darkGrayColor()
            
            //Create a label to display the message and add it to the alertView
            let width = alertView.bounds.width
            let theMessage = UILabel(frame: CGRectMake(20, 0, width - 40, CGRectGetHeight(alertView.bounds)));
            theMessage.numberOfLines = 0
            theMessage.lineBreakMode = .ByWordWrapping;
            
            theMessage.text = message
            theMessage.textColor = UIColor.whiteColor()
            alertView.addSubview(theMessage)
            
            topController.view.addSubview(alertView)
            
            //Create the ending frame or where you want it to end up on screen, in this case 0 y origin
            var newFrm = alertView.frame;
            newFrm.origin.y = 0;
            
            //Animate it in
            UIView.animateWithDuration(
                1,
                delay:0,
                options:[],
                animations: {
                    alertView.frame.origin.y = 0
                },
                completion: { (finished: Bool) in
                    UIView.animateWithDuration(
                        0.5,
                        delay:2,
                        options:[],
                        animations: {
                            alertView.frame.origin.y = -80
                        },
                        completion: { (f:Bool) in
                            alertView.removeFromSuperview()
                        })
            })
            
        }
    }
    
    
    static func showBannerMessage()
    {

        
  
    }
}