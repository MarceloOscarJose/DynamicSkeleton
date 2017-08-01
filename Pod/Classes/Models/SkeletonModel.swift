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
    var repeating: Int
    var position: SkeletonPosition!
    var height: Int?

    public init(view: NSObject.Type, repeating: Int = 1, position: SkeletonPosition, height: Int?) {
        self.view = view
        self.repeating = repeating
        self.position = position
        self.height = height
    }
}
