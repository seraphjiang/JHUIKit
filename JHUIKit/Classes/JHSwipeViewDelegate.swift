//
//  JHSwipeViewDelegate.swift
//  Pods
//
//  Created by Huan Jiang on 5/5/16.
//
//

public protocol JHSwipeViewDelegate: class{
    func cardUsedUp()
    func cardSwiped(liked: Bool, viewSwiped:UIView)
    func addNextCard()
}