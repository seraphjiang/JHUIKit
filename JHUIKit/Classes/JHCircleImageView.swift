//
//  JHCircleImageView.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//  Copyright © 2016 quanware.com. All rights reserved.
//

import UIKit
import QuartzCore

/// A Image with circle mask
@IBDesignable
public class JHCircleImageView: UIView {
    let lineWidth = 10.0
    var imageLayer: CALayer!
    
    /// image property you could assign image and see effective immediately through interface builder
    @IBInspectable var image: UIImage! {
        didSet { updateLayerProperties() }
    }
    
    /**
     relayout layer
     */
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
    
    /**
     update layer after content changed
     */
    public func updateLayerProperties()
    {
        if (imageLayer != nil) {
            if let i = image {
                imageLayer.contents = i.CGImage
            }
        }
    }
}