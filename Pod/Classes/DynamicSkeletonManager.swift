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
    var skeletonMainView: UIView = UIView()

    public init() {
        
    }

    public func createSkeleton(view: UIView, model: [SkeletonModel]) {

        self.createMainConstraints(view: view)

        for skeleton in model {

            let containerView = UIView()
            containerView.clipsToBounds = true
            skeletonMainView.addSubview(containerView)
            createModelConstraints(skeleton: skeleton, view: containerView)

            let offsetHeight = (skeleton.height != nil) ? skeleton.height : skeleton.position.height
            let repeating = skeleton.repeating == 0 ? Int(ceil(Float(containerView.frame.size.height) / Float(offsetHeight!))) : skeleton.repeating
            var index = 0

            repeat {
                createSkeletonViews(view: skeleton.view as! UIView.Type, height: offsetHeight!, parentView: containerView, index: index)
                index = index + 1
            } while(index < repeating)
        }
    }

    func createSkeletonViews(view: UIView.Type, height: Int, parentView: UIView, index: Int) {

        let viewTop = (index * height)

        let viewClass:UIView = view.init()
        parentView.addSubview(viewClass)

        viewClass.autoPinEdge(.top, to: .top, of: parentView, withOffset: CGFloat(viewTop))
        viewClass.autoPinEdge(.left, to: .left, of: parentView, withOffset: 0)
        viewClass.autoPinEdge(.right, to: .right, of: parentView, withOffset: 0)
        viewClass.autoSetDimension(.height, toSize: CGFloat(height))

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

    // MARK: Constraints
    func createMainConstraints(view: UIView) {
        view.addSubview(skeletonMainView)
        skeletonMainView.autoPinEdge(.top, to: .top, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.left, to: .left, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.right, to: .right, of: view, withOffset: 0)
        view.layoutSubviews()
    }

    func createModelConstraints(skeleton: SkeletonModel, view: UIView) {
        if let topOffset = skeleton.position.top {
            view.autoPinEdge(.top, to: .top, of: skeletonMainView, withOffset: CGFloat(topOffset))
        }
        if let bottomOffset = skeleton.position.bottom {
            view.autoPinEdge(.bottom, to: .bottom, of: skeletonMainView, withOffset: CGFloat(-bottomOffset))
        }
        if let leftOffset = skeleton.position.left {
            view.autoPinEdge(.left, to: .left, of: skeletonMainView, withOffset: CGFloat(leftOffset))
        }
        if let rightOffset = skeleton.position.right {
            view.autoPinEdge(.right, to: .right, of: skeletonMainView, withOffset: CGFloat(-rightOffset))
        }
        if let offsetHeight = skeleton.position.height {
            view.autoSetDimension(.height, toSize: CGFloat(offsetHeight))
        }

        skeletonMainView.layoutSubviews()
    }
    
    //func create
}
