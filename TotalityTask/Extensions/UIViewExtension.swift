//
//  UIViewExtensions.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 18/06/21.
//

import UIKit

extension UIView {
    
    // Slide Animation for UIView

    func slideInFromLeft(_ duration: TimeInterval = 1.0, _ beginTime: TimeInterval = 0.0, _ completionDelegate: CAAnimationDelegate? = nil) {

        let slideInFromLeftTransition = CATransition()
        
        if let delegate: CAAnimationDelegate = completionDelegate {
            slideInFromLeftTransition.delegate = delegate
        }
        
        slideInFromLeftTransition.type = CATransitionType.push
        slideInFromLeftTransition.subtype = CATransitionSubtype.fromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.beginTime = beginTime
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromLeftTransition.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
        fadeIn(1.0, 0.5, nil)
    }
    
    func slideInFromRight(_ duration: TimeInterval = 1.0, _ beginTime: TimeInterval = 0.0, _ completionDelegate: CAAnimationDelegate? = nil) {

        let slideInFromRightTransition = CATransition()
        
        if let delegate: CAAnimationDelegate = completionDelegate {
            slideInFromRightTransition.delegate = delegate
        }
        
        slideInFromRightTransition.type = CATransitionType.push
        slideInFromRightTransition.subtype = CATransitionSubtype.fromRight
        slideInFromRightTransition.duration = duration
        slideInFromRightTransition.beginTime = beginTime
        slideInFromRightTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromRightTransition.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(slideInFromRightTransition, forKey: "slideInFromRightTransition")
        fadeIn(1.0, 0.5, nil)
    }
    
    func slideInFromTop(_ duration: TimeInterval = 1.0, _ beginTime: TimeInterval = 0.0, _ completionDelegate: CAAnimationDelegate? = nil) {

        let slideInFromTopTransition = CATransition()
        
        if let delegate: CAAnimationDelegate = completionDelegate {
            slideInFromTopTransition.delegate = delegate
        }
        
        slideInFromTopTransition.type = CATransitionType.push
        slideInFromTopTransition.subtype = CATransitionSubtype.fromBottom
        slideInFromTopTransition.duration = duration
        slideInFromTopTransition.beginTime = beginTime
        slideInFromTopTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromTopTransition.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(slideInFromTopTransition, forKey: "slideInFromTopTransition")
        fadeIn(1.0, 0.5, nil)
    }
    
    func slideInFromBottom(_ duration: TimeInterval = 1.0, _ beginTime: TimeInterval = 0.0, _ completionDelegate: CAAnimationDelegate? = nil) {

        let slideInFromBottomTransition = CATransition()
        
        if let delegate: CAAnimationDelegate = completionDelegate {
            slideInFromBottomTransition.delegate = delegate
        }
        
        slideInFromBottomTransition.type = CATransitionType.push
        slideInFromBottomTransition.subtype = CATransitionSubtype.fromTop
        slideInFromBottomTransition.duration = duration
        slideInFromBottomTransition.beginTime = beginTime
        slideInFromBottomTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromBottomTransition.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(slideInFromBottomTransition, forKey: "slideInFromBottomTransition")
        fadeIn(1.0, 0.5, nil)
    }
    
    func fadeIn(_ duration: TimeInterval = 1.0, _ delay: TimeInterval = 0.0, _ completionDelegate: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    func fadeOut(_ duration: TimeInterval = 1.0, _ delay: TimeInterval = 0.0, _ completionDelegate: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
}
