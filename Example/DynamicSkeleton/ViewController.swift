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
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue

        let rowsModel = SkeletonModel(view: self.view, image: UIImage(named: "skeleton")!, repeating: 0, left: 0, right: 0, top: 0, bottom: 0, height: 64, spacing: 10)
        let gradient = DynamicSkeletonManager()

        gradient.createSkeleton(model: rowsModel)
    }
}
