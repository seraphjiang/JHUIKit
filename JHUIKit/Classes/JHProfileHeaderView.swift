//
//  JHProfileHeaderView.swift
//  Pods
//
//  Created by Huan Jiang on 5/6/16.
//
//

import UIKit

@IBDesignable
public class JHProfileHeaderView: UIView {
    var blurBackground: UIImageView!
    var avatar:JHCircleImageView!
    var imageLayer: CALayer!

    @IBInspectable var image: UIImage! {
        didSet { updateLayerProperties() }
    }
    
    @IBInspectable var radius: CGFloat = 100 {
        didSet { updateLayerProperties() }
    }
    
    public func updateLayerProperties()
    {
        if (blurBackground != nil) {
            if let i = image {
                self.blurBackground.image = image
                let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
                visualEffectView.frame = blurBackground.bounds
                blurBackground.addSubview(visualEffectView)
            }
        }
        
        if (avatar != nil) {
            if let i = image {
                self.avatar.image = image
            }
        }
    }
    
    public override func layoutSubviews() {

        if self.blurBackground == nil {
            self.blurBackground = UIImageView(frame: CGRectMake(0,0, self.frame.width, self.frame.height))
            self.addSubview(blurBackground)
        }
        
        if self.avatar == nil {
            self.avatar = JHCircleImageView(frame: CGRectMake((self.frame.width-radius)/2, (self.frame.height-radius)/2, radius, radius));
            self.addSubview(avatar);
        }
        
        updateLayerProperties()
    }
}
