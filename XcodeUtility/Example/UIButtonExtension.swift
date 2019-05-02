//
//  UIButtonExtension.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

public extension UIButton {

    /*
    func imageFromURL(_ url: String, placeholder: UIImage? = nil, fadeIn: Bool = true, shouldCacheImage: Bool = true, closure: ((_ image: UIImage?) -> ())? = nil, expire: ((_ isExpire: Bool?) -> ())? = nil)
    {
        
            _ = UIImage.image(fromURL: url, placeholder: placeholder, shouldCacheImage: shouldCacheImage, closure: {
            
            (image: UIImage?) in
            if image == nil {
                return
            }
            self.setImage(image, for: .normal)
//            self.setBackgroundImage(image, for: .normal)
                
            if fadeIn {
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionFade
                self.layer.add(transition, forKey: nil)
            }
            closure?(image)
        }, expire:  { (isExPire : Bool?) in
            
            expire?(isExPire)
        })
    }*/
}
