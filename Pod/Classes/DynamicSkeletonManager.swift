//
//  DynamicSkeleton.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit
import PureLayout

open class DynamicSkeletonManager {

    public static let sharedInstance = DynamicSkeletonManager()

    public init() {
        
    }

    public func createSkeleton(view: UIView, image: UIImage) {
        
        let skeletonView = SkeletonView()
        view.addSubview(skeletonView)

        skeletonView.autoPinEdge(.top, to: .top, of: view)
        skeletonView.autoPinEdge(.left, to: .left, of: view)
        skeletonView.autoPinEdge(.right, to: .right, of: view)
        skeletonView.autoPinEdge(.bottom, to: .bottom, of: view)

        let imageView = UIImageView()
        imageView.image = image
        skeletonView.addSubview(imageView)

        imageView.autoPinEdge(.top, to: .top, of: skeletonView)
        imageView.autoPinEdge(.left, to: .left, of: skeletonView)
        imageView.autoPinEdge(.right, to: .right, of: skeletonView)
        imageView.autoSetDimension(.height, toSize: 64)

        skeletonView.slide(direction: .right)
    }

    public func createConstraints() {
        
    }
}
