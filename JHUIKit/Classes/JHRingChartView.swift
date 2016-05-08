//
//  JHRingChartView.swift
//  Pods
//
//  Created by Huan Jiang on 5/7/16.
//
//

import UIKit

public class JHRingChartView: UIView {

    public override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext();
        CGContextAddEllipseInRect(ctx, rect);
        CGContextAddEllipseInRect(ctx,
                                  CGRectMake(
                                    rect.origin.x + 10,
                                    rect.origin.y + 10,
                                    rect.size.width - 20,
                                    rect.size.height - 20));
        CGContextSetFillColor(ctx, CGColorGetComponents(UIColor.blueColor().CGColor));
        CGContextEOFillPath(ctx);
    }
}
