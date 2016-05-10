//
//  JHImageRateRingView.swift
//  Pods
//
//  Created by Huan Jiang on 5/7/16.
//
//

import UIKit

/// A nice view support ring with rate value and image with mask, refer to https://developer.apple.com/videos/play/wwdc2014/411/
@IBDesignable
public class JHImageRateRingView: UIView {
    var backgroundRingLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
    
    var imageLayer: CALayer!
    var imageMaskLayer: CAShapeLayer!
    
    /// rating
    @IBInspectable
    public var rating: CGFloat = 0.6 {
        didSet {
            updateLayerProperties()
        }
    }

    /// line width of ring
    @IBInspectable
    public var lineWidth: CGFloat = 10.0 {
        didSet {
            updateLayerProperties()
        }
    }
    
    /// image ring
    @IBInspectable
    public var image: UIImage! {
        didSet { updateLayerProperties() }
    }

    /**
     layout subviews
     */
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if (backgroundRingLayer == nil) {
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
            
            //            let rect = bounds
            let rect = CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            backgroundRingLayer.path = path.CGPath
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = lineWidth
            backgroundRingLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).CGColor
        }
        
        backgroundRingLayer.frame = layer.bounds
        
        if(ringLayer == nil) {
            ringLayer = CAShapeLayer()
            let innerRect = CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0)
            let innerPath = UIBezierPath(ovalInRect: innerRect)
            
            ringLayer.path = innerPath.CGPath
            ringLayer.fillColor = nil
            ringLayer.lineWidth = lineWidth
            ringLayer.strokeColor = UIColor.blueColor().CGColor //mask color
            ringLayer.anchorPoint = CGPointMake(0.5, 0.5)
            ringLayer.transform = CATransform3DRotate(ringLayer.transform, CGFloat(-M_PI/2), 0, 0, 1)
            
            layer.addSublayer(ringLayer)
        }
        ringLayer.frame = layer.bounds
        
        if(imageLayer == nil) {
            imageMaskLayer = CAShapeLayer()
            let insetBounds = CGRectInset(bounds, lineWidth + 3, lineWidth + 3)
            let innerPath = UIBezierPath(ovalInRect: insetBounds)
            
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
        //        imageLayer.frame = layer.bounds
        
        updateLayerProperties()
    }

    /**
     update layer properties
     */
    func updateLayerProperties() {
        if (ringLayer != nil) {
            ringLayer.strokeEnd = rating
            
            var strokeColor = UIColor.lightGrayColor()
            switch rating {
            case let r where r >= 0.75:
                strokeColor = UIColor(hue: 112.0/360.0, saturation: 0.39, brightness: 0.85, alpha: 1.0)
            case let r where r >= 0.5:
                strokeColor = UIColor(hue: 208.0/360.0, saturation: 0.51, brightness: 0.75, alpha: 1.0)
            case let r where r >= 0.25:
                strokeColor = UIColor(hue: 40.0/360.0, saturation: 0.39, brightness: 0.85, alpha: 1.0)
            default:
                strokeColor = UIColor(hue: 359.0/360.0, saturation: 0.48, brightness: 0.63, alpha: 1.0)
            }
            
            ringLayer.strokeColor = strokeColor.CGColor
        }
        
        if (imageLayer != nil){
            if let i = image {
                imageLayer.contents = i.CGImage
            }
        }
    }

    /**
     only for interface builder/ won't impact runtime
     */
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        if self.image == nil {
            self.image = UIImage(named: "mask", inBundle: NSBundle(forClass: JHImageRateRingView.self), compatibleWithTraitCollection: nil)
        }        
    }
}
