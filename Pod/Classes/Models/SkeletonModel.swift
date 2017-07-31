//
//  SkeletonModel.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit

public class SkeletonModel {

    var view: NSObject.Type
    var repeating: Int = 1
    var position: SkeletonPosition = SkeletonPosition(left: nil, right: nil, top: nil, bottom: nil)
    var height: Float = 0
    var spacing: Int?

    public init(view: NSObject.Type, repeating: Int?, position: SkeletonPosition, height: Float?, spacing: Int?) {
        self.view = view
        self.repeating = repeating!

        self.position = position
        self.height = height!
        self.spacing = spacing
    }
}
