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
            createContainerConstraints(skeleton: skeleton, view: containerView)

            let offsetHeight = (skeleton.height != nil) ? skeleton.height : skeleton.position.height
            let repeating = skeleton.repeating == 0 ? Int(ceil(Float(containerView.frame.size.height) / Float(offsetHeight!))) : skeleton.repeating
            var index = 0

            repeat {
                createSkeletonViews(view: skeleton.view as! UIView.Type, height: offsetHeight!, containerView: containerView, index: index, repeating: repeating)
                index = index + 1
            } while(index < repeating)
        }
    }

    public func createSkeletonViews(view: UIView.Type, height: Int, containerView: UIView, index: Int, repeating: Int) {

        let skeletonView = view.init()
        containerView.addSubview(skeletonView)
        createSkeletonConstraints(height: height, index: index, view: skeletonView, containerView: containerView)

        //let offsetheight = Int(containerView.frame.size.height / CGFloat(repeating))

        for element in skeletonView.subviews {
            if let elementSkeleton = element as? SkeletonView {
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

    // MARK: Constraints
    func createMainConstraints(view: UIView) {
        view.addSubview(skeletonMainView)
        skeletonMainView.autoPinEdge(.top, to: .top, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.left, to: .left, of: view, withOffset: 0)
        skeletonMainView.autoPinEdge(.right, to: .right, of: view, withOffset: 0)
        view.layoutSubviews()
    }

    func createContainerConstraints(skeleton: SkeletonModel, view: UIView) {
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

    func createSkeletonConstraints(height: Int, index: Int, view: UIView, containerView: UIView) {
        view.autoPinEdge(.top, to: .top, of: containerView, withOffset: CGFloat(index * height))
        view.autoPinEdge(.left, to: .left, of: containerView, withOffset: 0)
        view.autoPinEdge(.right, to: .right, of: containerView, withOffset: 0)
        view.autoSetDimension(.height, toSize: CGFloat(height))
        view.layoutSubviews()
    }
}
