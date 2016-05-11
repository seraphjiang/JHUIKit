//
//  JHProfileCardView.swift
//  Pods
//
//  Created by Huan Jiang on 5/6/16.

import UIKit

/// Designable profile card view
public class JHProfileCardView: JHSwipeView {
    var blurBackground: UIImageView!
    var avatar:JHCircleImageView! = JHCircleImageView()

    /// image for profile card
    @IBInspectable public var image: UIImage! {
        didSet { updateLayerProperties() }
    }

    /// radius for image
    @IBInspectable public var radius: CGFloat = 100 {
        didSet { updateLayerProperties() }
    }
    
    /**
     init for view created from storyboard
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     init with frame
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }

    /**
     init with frame and image
     
     - parameter frame:	fram rect
     - parameter image:	image for profile card
     
     */
    public init(frame: CGRect, image:UIImage)
    {
        super.init(frame: frame)
        self.image = image
        self.initViews()
    }
    
    /**
     init with frame, image and image radius
     
     - parameter frame: frame rect
     - parameter image:	image of profile
     - parameter radius:	image radius
     */
    public init(frame: CGRect, image:UIImage, radius: CGFloat)
    {
        super.init(frame: frame)
        self.radius = radius
        self.image = image
        self.initViews()
    }
    
    func initViews() {
        self.backgroundColor = UIColor.whiteColor()
        self.alpha = 1
        self.addAllSubviews()
        self.applyBorder()
        self.bringSubviewToFront(self.checkImageView!)
        self.bringSubviewToFront(self.closeImageView!)
    }
    
    func addAllSubviews()
    {
        let cardView = JHProfileHeaderView(frame: CGRectMake(1,1, self.frame.width-2, self.frame.width * 3 / 4 - 2), radius: self.radius)
        
        cardView.image = image
        addSubview(cardView)
    }
    
    
    /**
     add nice border
     */
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
    
    /**
     override draw rect to adopt change of inspectable layer property
     
     - parameter rect:	rect
     */
    override public func drawRect(rect: CGRect) {
        updateLayerProperties()
    }
    
    /**
     update layer properties
     */
    public func updateLayerProperties()
    {
        layer.masksToBounds = true
        layer.cornerRadius = 12.0
    }
    
    
    /**
    layout subviews
     */
    public override func layoutSubviews() {
        updateLayerProperties()
    }
}
