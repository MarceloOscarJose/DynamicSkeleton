//
//  SkeletonPosition.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/31/17.
//
//

import Foundation

public class SkeletonPosition {
    
    var left: Float?
    var right: Float?
    var top: Float?
    var bottom: Float?
    
    public init(left: Float?, right: Float?, top: Float?, bottom: Float?) {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
    }
}
