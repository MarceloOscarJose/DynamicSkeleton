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

        let exitView = Bundle.main.loadNibNamed("ExitView", owner: ExitView(), options: nil)?[0] as! UIView

        let containers = [
            DynamicSkeletonModel(view: HeaderView(), repeating: 1, left: 0, right: 0, top: 0, bottom: nil, height: 82),
            DynamicSkeletonModel(view: RowView(), repeating: 0, left: 0, right: 0, top: 82, bottom: 50, height: 74),
            DynamicSkeletonModel(view: exitView, repeating: 1, left: 0, right: 0, top: nil, bottom: 0, height: 50)
        ]

        DynamicSkeleton.sharedInstance.createSkeleton(mainView: self.view, models: containers)
    }
}
