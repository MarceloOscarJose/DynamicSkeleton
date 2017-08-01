//
//  HeaderView.swift
//  DynamicSkeleton
//
//  Created by Marcelo Oscar José on 7/31/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DynamicSkeleton
import PureLayout

class HeaderView: UIView {

    /*let activityImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0 / 255, green: 148 / 255, blue: 223 / 255, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 0
        return view
    }()*/

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        self.backgroundColor = UIColor(red: 0 / 255, green: 148 / 255, blue: 223 / 255, alpha: 1)
        //self.createConstraints()
    }
    
    func createConstraints() {
    }
}
