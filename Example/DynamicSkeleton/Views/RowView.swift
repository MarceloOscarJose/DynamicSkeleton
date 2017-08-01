//
//  RowView.swift
//  DynamicSkeleton
//
//  Created by Marcelo Oscar José on 7/31/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DynamicSkeleton
import PureLayout

class RowView: UIView {

    let activityImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 0
        return view
    }()
    let title: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        return view
    }()
    let amount: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        return view
    }()
    let date: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
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
        self.addSubview(activityImage)
        self.addSubview(title)
        self.addSubview(amount)
        self.addSubview(date)
        self.createConstraints()
    }

    func createConstraints() {
        self.backgroundColor = UIColor.white

        activityImage.autoSetDimension(.height, toSize: 50)
        activityImage.autoSetDimension(.width, toSize: 50)
        activityImage.autoPinEdge(.top, to: .top, of: self, withOffset: 12)
        activityImage.autoPinEdge(.left, to: .left, of: self, withOffset: 16)

        title.autoSetDimension(.height, toSize: 10)
        title.autoPinEdge(.left, to: .right, of: activityImage, withOffset: 14)
        title.autoPinEdge(.top, to: .top, of: self, withOffset: 24)
        title.autoSetDimension(.width, toSize: 150)

        amount.autoSetDimension(.height, toSize: 10)
        amount.autoSetDimension(.width, toSize: 60)
        amount.autoPinEdge(.top, to: .top, of: self, withOffset: 24)
        amount.autoPinEdge(.right, to: .right, of: self, withOffset: -16)

        date.autoSetDimension(.height, toSize: 10)
        date.autoSetDimension(.width, toSize: 40)
        date.autoPinEdge(.top, to: .bottom, of: amount, withOffset: 10)
        date.autoPinEdge(.right, to: .right, of: self, withOffset: -16)
    }
}
