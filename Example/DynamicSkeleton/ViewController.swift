//
//  ViewController.swift
//  DynamicSkeleton
//
//  Created by MarceloJoseML on 07/29/2017.
//  Copyright (c) 2017 MarceloJoseML. All rights reserved.
//

import UIKit
import DynamicSkeleton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()

        let headerPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: 0, bottom: nil, height: 78)
        let headerModel = SkeletonModel(view: HeaderView.self, repeating: 1, position: headerPosition, height: nil)

        let rowsPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: 78, bottom: 100, height: nil)
        let rowsModel = SkeletonModel(view: RowView.self, repeating: 0, position: rowsPosition, height: 74)

        let bottonPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: nil, bottom: 0, height: 100)
        let bottonModel = SkeletonModel(view: HeaderView.self, repeating: 1, position: bottonPosition, height: nil)

        DynamicSkeletonManager.sharedInstance.createSkeleton(view: self.view, model: [headerModel, rowsModel, bottonModel])
    }

    func setupNavigationBar() {
        self.title = "DynamicSkeleton"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0 / 255, green: 148 / 255, blue: 223 / 255, alpha: 1)
    }
}
