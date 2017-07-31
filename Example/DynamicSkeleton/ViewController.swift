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

        /*let headerPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: 0, bottom: nil)
        let headerColor = UIColor(red: 117 / 255, green: 193 / 255, blue: 245 / 255, alpha: 1.0)
        let headerModel = SkeletonModel(view: UIImage(named: "header")!, color: headerColor, repeating: 1, position: headerPosition, height: 78, spacing: 0, repeatHeight: nil)*/

        let rowsPosition: SkeletonPosition = SkeletonPosition(left: 0, right: 0, top: 0, bottom: 0)
        let rowsModel = SkeletonModel(view: RowView.self, repeating: 0, position: rowsPosition, height: 0, spacing: 0)

        DynamicSkeletonManager.sharedInstance.createSkeleton(view: self.view, model: [rowsModel])
    }

    func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0 / 255, green: 148 / 255, blue: 223 / 255, alpha: 1)
    }
}
