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
    
    override public init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    public init(frame: CGRect, radius: CGFloat) {
        self.radius = radius
        super.init(frame:frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable public var image: UIImage! {
        didSet { updateLayerProperties() }
    }
    
    @IBInspectable public var radius: CGFloat = 100 {
        didSet { updateLayerProperties() }
    }
    
    public func updateLayerProperties()
    {
        if (blurBackground != nil) {
            if let i = image {
                self.blurBackground.image = i
                let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
                visualEffectView.frame = blurBackground.bounds
                blurBackground.addSubview(visualEffectView)
            }
        }
        
        if (avatar != nil) {
            if let i = image {
                self.avatar.image = i
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
