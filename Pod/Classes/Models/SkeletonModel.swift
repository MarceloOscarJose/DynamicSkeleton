//
//  SkeletonModel.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit

public class SkeletonModel {

    var view: UIView
    var image: UIImage
    var repeating: Int = 1
    var left: Float?
    var right: Float?
    var top: Float?
    var bottom: Float?
    var height: Float?
    var spacing: Int?

    public init(view: UIView, image: UIImage, repeating: Int?, left: Float?, right: Float?, top: Float?, bottom: Float?, height: Float?, spacing: Int?) {
        self.view = view
        self.image = image
        self.repeating = repeating!

        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
        self.height = height
        self.spacing = spacing
    }
}
