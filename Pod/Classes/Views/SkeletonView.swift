//
//  SkeletonView.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit

public class SkeletonView: UIView {
    public let gradientView = GradientView(frame: .zero)
    
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
    }

    public func setGradientColor(color: UIColor) {
        self.gradientView.gradientLayer.colors = [color.cgColor, color.brightened(by: 0.96).cgColor, color.cgColor]
    }

    public func slide(direction: GradientDirection) {
        gradientView.layer.cornerRadius = self.layer.cornerRadius
        gradientView.layer.borderWidth = self.layer.borderWidth
        self.gradientView.gradientLayer.slide(direction: direction)
    }

    public func stopSliding() {
        self.gradientView.gradientLayer.stopSliding()
    }
}


