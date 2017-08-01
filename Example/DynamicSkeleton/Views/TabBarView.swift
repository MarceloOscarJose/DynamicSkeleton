//
//  TabBarView.swift
//  DynamicSkeleton
//
//  Created by Marcelo Oscar José on 7/31/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DynamicSkeleton
import PureLayout

class TabBarView: UIView {

    let division: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1)
        return view
    }()
    let activityIcon: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    let pointIcon: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    let payIcon: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    let moneyIcon: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    let settingsIcon: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
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
        self.addSubview(division)
        self.addSubview(activityIcon)
        self.addSubview(pointIcon)
        self.addSubview(payIcon)
        self.addSubview(moneyIcon)
        self.addSubview(settingsIcon)

        self.createConstraints()
    }

    func createConstraints() {

        division.autoPinEdge(.top, to: .top, of: self, withOffset: 0)
        division.autoPinEdge(.left, to: .left, of: self, withOffset: 0)
        division.autoPinEdge(.right, to: .right, of: self, withOffset: 0)
        division.autoSetDimension(.height, toSize: 1)

        activityIcon.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        activityIcon.autoPinEdge(.left, to: .left, of: self, withOffset: 29)
        activityIcon.autoSetDimension(.height, toSize: 30)
        activityIcon.autoSetDimension(.width, toSize: 30)

        pointIcon.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        pointIcon.autoPinEdge(.left, to: .right, of: activityIcon, withOffset: 46)
        pointIcon.autoSetDimension(.height, toSize: 30)
        pointIcon.autoSetDimension(.width, toSize: 30)
        
        payIcon.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        payIcon.autoPinEdge(.left, to: .right, of: pointIcon, withOffset: 46)
        payIcon.autoSetDimension(.height, toSize: 30)
        payIcon.autoSetDimension(.width, toSize: 30)
        
        moneyIcon.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        moneyIcon.autoPinEdge(.left, to: .right, of: payIcon, withOffset: 46)
        moneyIcon.autoSetDimension(.height, toSize: 30)
        moneyIcon.autoSetDimension(.width, toSize: 30)
        
        settingsIcon.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        settingsIcon.autoPinEdge(.left, to: .right, of: moneyIcon, withOffset: 46)
        settingsIcon.autoSetDimension(.height, toSize: 30)
        settingsIcon.autoSetDimension(.width, toSize: 30)
    }
}
