//
//  CAGradientLayer+Slide.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit

extension CABasicAnimation {
    func applyGradientTransition(_ transition: GradientTransition) {
        fromValue = NSValue(cgPoint: transition.from.cgPoint)
        toValue = NSValue(cgPoint: transition.to.cgPoint)
    }
}

public extension CAGradientLayer {

    fileprivate static let KSlideAnimationKey = "SlieAnimation"

    public func slide(to dir: GradientDirection) {
        let startPointTransition = dir.transition(for: .startPoint)
        let endPointTransition = dir.transition(for: .endPoint)
        
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(startPoint))
        startPointAnim.applyGradientTransition(startPointTransition)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(endPoint))
        endPointAnim.applyGradientTransition(endPointTransition)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 0.8
        animGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animGroup.repeatCount = .infinity
        
        add(animGroup, forKey: CAGradientLayer.KSlideAnimationKey)
    }

    public func stopSliding() {
        removeAnimation(forKey: CAGradientLayer.KSlideAnimationKey)
    }
}
