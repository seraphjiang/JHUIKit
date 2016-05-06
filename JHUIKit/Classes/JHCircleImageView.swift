//
//  JHCircleImageView.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//  Copyright © 2016 quanware.com. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
public class JHCircleImageView: UIView {
    let lineWidth = 10.0
    var imageView: UIImageView!
    var imageLayer: CALayer!
    
    @IBInspectable var image: UIImage! {
        didSet { updateLayerProperties() }
    }
    
    public override func layoutSubviews() {
        if (imageLayer == nil) {
            let insetBounds = CGRectInset(bounds, 1, 1)
            let innerPath = UIBezierPath(ovalInRect: insetBounds)
            
            let imageMaskLayer = CAShapeLayer()
            imageMaskLayer.path = innerPath.CGPath
            imageMaskLayer.fillColor = UIColor.blackColor().CGColor
            imageMaskLayer.frame = bounds
            layer.addSublayer(imageMaskLayer)
            
            imageLayer = CALayer()
            imageLayer.mask = imageMaskLayer
            imageLayer.frame = bounds
            imageLayer.backgroundColor = UIColor.lightGrayColor().CGColor
            imageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(imageLayer)
        }
        
        imageLayer.frame = layer.bounds
        
        updateLayerProperties()
    }
    
    public func updateLayerProperties()
    {
        if (imageLayer != nil) {
            if let i = image {
                imageLayer.contents = i.CGImage
            }
        }
    }
}