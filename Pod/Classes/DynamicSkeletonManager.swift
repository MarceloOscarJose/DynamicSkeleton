//
//  DynamicSkeleton.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import UIKit

public class DynamicSkeletonManager {

    public static let sharedInstance = DynamicSkeletonManager()

    public static func createSkeleton(view: UIView, image: UIImage) {
        
        let skeletonView = SkeletonView()
        
        let imageView = UIImageView()
        imageView.image = image
        
        skeletonView.addSubview(imageView)
        view.addSubview(skeletonView)
    
        skeletonView.slide(to: .right)
    }
}
