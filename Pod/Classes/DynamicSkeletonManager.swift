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

    public func createSkeleton(model: SkeletonModel) {
    
        let skeletonView = SkeletonView()
        model.view.addSubview(skeletonView)

        skeletonView.autoPinEdge(.top, to: .top, of: model.view)
        skeletonView.autoPinEdge(.left, to: .left, of: model.view)
        skeletonView.autoPinEdge(.right, to: .right, of: model.view)
        skeletonView.autoPinEdge(.bottom, to: .bottom, of: model.view)

        let repeating: Int = (model.repeating == 0) ? Int(ceil(Float(model.view.frame.size.height) / model.height!)) : model.repeating

        for i in 0...repeating {
            let imageView = UIImageView()
            imageView.image = model.image
            skeletonView.addSubview(imageView)

            let topOffset = CGFloat(i * (Int(model.height!) + model.spacing!))
            imageView.autoPinEdge(.top, to: .top, of: skeletonView, withOffset: topOffset)
            imageView.autoPinEdge(.left, to: .left, of: skeletonView)
            imageView.autoPinEdge(.right, to: .right, of: skeletonView)
            imageView.autoSetDimension(.height, toSize: CGFloat(model.height!))
        }

        skeletonView.slide(direction: .right)
    }

    public func createConstraints() {
        
    }
}
