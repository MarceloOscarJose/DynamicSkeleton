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
    let skeletonMainView = UIView()

    public init() {
        
    }

    public func createSkeleton(view: UIView, model: [SkeletonModel]) {

        self.createMainConstraints(view: view)

        for skeleton in model {

            let modelView = UIView(frame: view.frame)
            modelView.clipsToBounds = true
            skeletonMainView.addSubview(modelView)
            self.createModelConstraints(model: skeleton, view: modelView)

            let repeatingHeight = Float(modelView.frame.size.height) / Float(modelView.frame.size.height)
            let repeating: Int = (skeleton.repeating == 0) ? Int(ceil(repeatingHeight)) : skeleton.repeating - 1

            for index in 0...repeating {
                createSkeletonViews(view: skeleton.view, height: repeatingHeight, spacing: skeleton.spacing!, parentView: modelView, index: index)
            }
        }
    }

    func createSkeletonViews(view: NSObject.Type, height: Float, spacing: Int, parentView: UIView, index: Int) {

        let viewClass = view.init() as! UIView

        let skeletonView = UIView(frame: CGRect(x: 0, y: (index * (Int(height) + spacing)), width: Int(parentView.bounds.width), height: Int(viewClass.frame.size.height)))
        parentView.addSubview(skeletonView)
        skeletonView.addSubview(viewClass)

        viewClass.autoPinEdge(.top, to: .top, of: skeletonView)
        viewClass.autoPinEdge(.bottom, to: .bottom, of: skeletonView)
        viewClass.autoPinEdge(.left, to: .left, of: skeletonView)
        viewClass.autoPinEdge(.right, to: .right, of: skeletonView)

        for element in viewClass.subviews {
            if let elementSkeleton = element as? SkeletonView {
                elementSkeleton.setGradientColor(color: elementSkeleton.backgroundColor!)
                elementSkeleton.slide(direction: .right)
            }
        }
    }

    func removeSkeleton() {
        skeletonMainView.removeFromSuperview()
    }

    func createMainConstraints(view: UIView) {
        view.addSubview(skeletonMainView)
        skeletonMainView.autoPinEdge(.top, to: .top, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.left, to: .left, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.right, to: .right, of: view, withOffset: 0)
    }

    func createModelConstraints(model: SkeletonModel, view: UIView) {
        if let topOffset = model.position.top {
            view.autoPinEdge(.top, to: .top, of: skeletonMainView, withOffset: CGFloat(topOffset))
        }
        if let bottomOffset = model.position.bottom {
            view.autoPinEdge(.bottom, to: .bottom, of: skeletonMainView, withOffset: CGFloat(-bottomOffset))
        }
        if let leftOffset = model.position.left {
            view.autoPinEdge(.left, to: .left, of: skeletonMainView, withOffset: CGFloat(leftOffset))
        }
        if let rightOffset = model.position.right {
            view.autoPinEdge(.right, to: .right, of: skeletonMainView, withOffset: CGFloat(-rightOffset))
        }
        if model.height != 0 {
            view.autoSetDimension(.height, toSize: CGFloat(model.height))
        }
    }

    func createSkeletonTopConstraints(model: SkeletonModel, view: UIView, lastView: UIView) {

        var spacing = 0

        if let spacingValue = model.spacing {
            spacing = spacingValue
        }

        if model.repeating == 0 || model.repeating > 1 {
            view.autoPinEdge(.top, to: .bottom, of: lastView, withOffset: CGFloat(spacing))
        } else {
            view.autoPinEdge(.top, to: .top, of: lastView, withOffset: CGFloat(spacing))
        }
    }

    func createSkeletonConstraints(model: SkeletonModel, view: UIView, lastView: UIView) {

        view.autoPinEdge(.left, to: .left, of: lastView, withOffset: 0)
        view.autoPinEdge(.right, to: .right, of: lastView, withOffset: 0)

        if model.height != 0 {
            view.autoSetDimension(.height, toSize: CGFloat(model.height))
        }
    }
}
