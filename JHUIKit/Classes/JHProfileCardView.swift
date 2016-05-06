//
//  JHProfileCardView.swift
//  Pods
//
//  Created by Huan Jiang on 5/6/16.
//
//

import UIKit

public class JHProfileCardView: JHSwipeView {
    var blurBackground: UIImageView!
    var avatar:JHCircleImageView! = JHCircleImageView()

    @IBInspectable public var image: UIImage! {
        didSet { updateLayerProperties() }
    }
    
    @IBInspectable public var radius: CGFloat = 100 {
        didSet { updateLayerProperties() }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(frame: CGRect, image:UIImage)
    {
        super.init(frame: frame)
        self.image = image
        self.initViews()
    }
    
    func initViews() {
        self.backgroundColor = UIColor.whiteColor()
        self.alpha = 1
        self.addAllSubviews()
        self.applyBorder()
    }
    
    func addAllSubviews()
    {
        let cardView = JHProfileHeaderView(frame: CGRectMake(1,1, self.frame.width-2, self.frame.width * 3 / 4 - 2))
        cardView.image = image
        addSubview(cardView)
    }
    
    override public func applyBorder()
    {
        // set Border outside
        let borderWidth = 1;
        let borderView = UIView()
        borderView.frame = CGRectInset(self.frame, CGFloat(borderWidth), 0)
        borderView.backgroundColor = UIColor.clearColor()
        borderView.layer.cornerRadius = 12; // if you like rounded corners
        borderView.layer.borderColor = UIColor.lightGrayColor().CGColor
        borderView.layer.borderWidth = CGFloat(borderWidth)
//        borderView.layer.masksToBounds = false;
        borderView.layer.masksToBounds = true;

        self.addSubview(borderView)
        self.bringSubviewToFront(borderView)
    }
    
    override public func drawRect(rect: CGRect) {
        updateLayerProperties()
    }
    
    public func updateLayerProperties()
    {
        layer.masksToBounds = true
        layer.cornerRadius = 12.0
    }
    
    public override func layoutSubviews() {
        updateLayerProperties()
    }
}
