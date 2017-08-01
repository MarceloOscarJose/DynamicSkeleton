//
//  ExitView.swift
//  DynamicSkeleton
//
//  Created by Marcelo Oscar José on 7/31/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DynamicSkeleton
import PureLayout

class ExitView: UIView {

    let dismissButton:UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss skeleton", for: .normal)
        button.backgroundColor = UIColor.black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        self.backgroundColor = UIColor.white
        self.addSubview(dismissButton)
    
        dismissButton.addTarget(self, action: #selector(dismissSkeleton), for: .touchUpInside)
        self.createConstraints()
    }

    func createConstraints() {
        dismissButton.autoPinEdge(.top, to: .top, of: self, withOffset: 0)
        dismissButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0)
        dismissButton.autoPinEdge(.left, to: .left, of: self, withOffset: 0)
        dismissButton.autoPinEdge(.right, to: .right, of: self, withOffset: 0)
    }

    func dismissSkeleton(sender: UIButton!) {
        DynamicSkeletonManager.sharedInstance.removeSkeleton { }
    }
}
