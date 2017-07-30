//
//  SkeletonView.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit

class SkeletonView: UIView {
    fileprivate let gradientView = GradientView(frame: .zero)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUpGradientView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpGradientView()
    }
    
    /// Sets up the `GradientView` with constraints that that cause it to fill the `UIView` entirely.
    fileprivate func setUpGradientView() {

        gradientView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(gradientView)
        
        let top = gradientView.topAnchor.constraint(equalTo: topAnchor)
        let bottom = gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let leading = gradientView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = gradientView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        NSLayoutConstraint.activate([top, bottom, leading, trailing])

        let baseColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 242 / 255, alpha: 1.0)
        gradientView.gradientLayer.colors = [baseColor.cgColor, baseColor.brightened(by: 0.95).cgColor, baseColor.cgColor]
    }

    public func slide(direction: GradientDirection) {
        self.gradientView.gradientLayer.slide(to: direction)
    }

    public func stopSliding() {
        self.gradientView.gradientLayer.stopSliding()
    }
}

extension UIColor {
    func brightened(by factor: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
    }
}
