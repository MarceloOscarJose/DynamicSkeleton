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
        let gradient = DynamicSkeletonManager()

        gradient.createSkeleton(view: self.view, image: UIImage(named: "skeleton")!)
    }
}
