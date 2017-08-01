//
//  SkeletonPosition.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/31/17.
//
//

import Foundation

public class SkeletonPosition {
    
    var left: Int?
    var right: Int?
    var top: Int?
    var bottom: Int?
    var height: Int?

    public init(left: Int?, right: Int?, top: Int?, bottom: Int?, height: Int?) {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
        self.height = height
    }
}
