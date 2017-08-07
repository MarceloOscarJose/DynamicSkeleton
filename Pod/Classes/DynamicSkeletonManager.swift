//
//  DynamicSkeleton.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit
import PureLayout

open class DynamicSkeletonModel {

    var view: UIView
    var repeating: Int = 1

    var left: Int?
    var right: Int?
    var top: Int?
    var bottom: Int?
    var height: Int?

    public init(view: UIView, repeating: Int, left: Int?, right: Int?, top: Int?, bottom: Int?, height: Int?) {
        self.view = view
        self.repeating = repeating

        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
        self.height = height
    }
}

open class DynamicSkeleton {

    public static let sharedInstance = DynamicSkeleton()
    var skeletonMainView: SkeletonMainView!

    public func createSkeleton(mainView: UIView, models: [DynamicSkeletonModel]) {

        self.skeletonMainView = SkeletonMainView(parentView: mainView)

        for model in models {

            let containerView = SkeletonContainerView(model: model, parentView: skeletonMainView)

            if model.repeating != 0 {
                containerView.setContainerheight(model: model)
            }

            model.view.layoutSubviews()
            let repeating = model.repeating == 0 ? Int(ceil(containerView.frame.height / CGFloat(model.height!))) : model.repeating

            for index in 0...repeating {
                createSkeletonViews(model: model, containerView: containerView, index: index)
            }
        }
    }

    func createSkeletonViews(model: DynamicSkeletonModel, containerView: UIView, index: Int) {

        let view = index == 0 ? model.view : type(of: model.view).init()
        let topOffset = CGFloat(model.height! * index)

        containerView.addSubview(view)
        view.autoPinEdge(.top, to: .top, of: containerView, withOffset: topOffset)
        view.autoPinEdge(.left, to: .left, of: containerView, withOffset: 0)
        view.autoPinEdge(.right, to: .right, of: containerView, withOffset: 0)

        if let height = model.height {
            view.autoSetDimension(.height, toSize: CGFloat(height))
        }

        for element in view.subviews {
            if let elementSkeleton = element as? SkeletonElementView {
                elementSkeleton.setGradientColor()
                elementSkeleton.slide(direction: .right)
            }
        }
    }

    public func removeSkeleton(completion: @escaping () -> Void) {

        let strongSelf = self

        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            strongSelf.skeletonMainView.alpha = 0
        }) { _ in
            strongSelf.skeletonMainView.removeFromSuperview()
            completion()
        }
    }
}
