//
//  JHSwipeViewDelegate.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//
//

/**
 *  delegate for make JHSwipeView, JHProfileCardView to communicate with other class like ViewController
 */
public protocol JHSwipeViewDelegate: class{
    
    /**
     card is used up
     */
    func cardUsedUp()
    
    /**
     card swiped
     
     - parameter liked: liked =true // swipe right, liked = false swipe left
     - parameter viewSwiped: handle to swiped view
     */
    func cardSwiped(liked: Bool, viewSwiped:UIView)
    
    /**
     callback for add next card
     */
    func addNextCard()
}