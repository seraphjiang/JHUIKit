//
//  JHRingView.swift
//  Pods
//
//  Created by Huan Jiang on 5/7/16.
//
//

import UIKit
/// A simple ring view
//https://developer.apple.com/videos/play/wwdc2014/411/
@IBDesignable
public class JHRingView: UIView {
    let lineWidth: CGFloat = 10.0
    var backgroundRingLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
 
    /**
     layout subviews to add ring
     */
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if (backgroundRingLayer == nil) {
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
            
            // stroke will have half out side border , half inside border, use inset to make sure 
            // we are drawing inside area we want.
            let rect = CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            backgroundRingLayer.path = path.CGPath
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = lineWidth
            backgroundRingLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).CGColor
            
        }
        
        backgroundRingLayer.frame = layer.bounds
    }

}
