//
//  ViewController.swift
//  DynamicSkeleton
//
//  Created by MarceloJoseML on 07/29/2017.
//  Copyright (c) 2017 MarceloJoseML. All rights reserved.
//

import UIKit
import PureLayout
import DynamicSkeleton

class ViewController: UIViewController {

    let skeletonView:UIView = UIView()

    let landingView:UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "landing")
        view.contentMode = .redraw
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.createLandingPage()
        self.createSkeletonContainer()
    }

    func setupNavigationBar() {
        self.title = "DynamicSkeleton"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0 / 255, green: 148 / 255, blue: 223 / 255, alpha: 1)
    }

    func createLandingPage() {
        self.view.addSubview(landingView)
        landingView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 0)
        landingView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)
        landingView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        landingView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
    }

    func createSkeletonContainer() {
        self.view.addSubview(skeletonView)

        skeletonView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 0)
        skeletonView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        skeletonView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        skeletonView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)

        let headerPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: 0, bottom: nil, height: 82)
        let headerModel = SkeletonModel(view: HeaderView.self, repeating: 1, position: headerPosition, height: nil)

        let rowsPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: 78, bottom: 0, height: nil)
        let rowsModel = SkeletonModel(view: RowView.self, repeating: 0, position: rowsPosition, height: 74)

        let exitPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: nil, bottom: 0, height: 50)
        let exitModel = SkeletonModel(view: ExitView.self, repeating: 0, position: exitPosition, height: nil)

        DynamicSkeletonManager.sharedInstance.createSkeleton(view: skeletonView, model: [headerModel, rowsModel, exitModel])
    }
}
