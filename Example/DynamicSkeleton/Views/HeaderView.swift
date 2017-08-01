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

    let balanceTitle: UIImageView = {
        let view = UIImageView(image: UIImage(named: "headerTop"))
        view.contentMode = .redraw
        return view
    }()
    let balanceAmount: UIImageView = {
        let view = UIImageView(image: UIImage(named: "headerBottom"))
        view.contentMode = .redraw
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
        self.backgroundColor = UIColor(red: 0 / 255, green: 148 / 255, blue: 223 / 255, alpha: 1)
        self.addSubview(balanceTitle)
        self.addSubview(balanceAmount)
        self.createConstraints()
    }

    func createConstraints() {
        balanceTitle.autoPinEdge(.top, to: .top, of: self, withOffset: 20)
        balanceTitle.autoPinEdge(.left, to: .left, of: self, withOffset: 14)
        balanceTitle.autoSetDimension(.height, toSize: 14)
        balanceTitle.autoSetDimension(.width, toSize: 124)

        balanceAmount.autoPinEdge(.top, to: .bottom, of: balanceTitle, withOffset: 8)
        balanceAmount.autoPinEdge(.left, to: .left, of: self, withOffset: 14)
        balanceAmount.autoSetDimension(.height, toSize: 18)
        balanceAmount.autoSetDimension(.width, toSize: 124)
    }
}
