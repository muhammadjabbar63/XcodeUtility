//
//  UIButtonExtention.swift
//  Bazhookah
//
//  Created by Administrator on 3/15/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    
    func pulsate() {
        
        if #available(iOS 9.0, *) {
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.1
            pulse.fromValue = 0.85
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 1
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0
            
            layer.add(pulse, forKey: "pulse")
        } else {
            // Fallback on earlier versions
        }
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    func imageFromURL(_ url: String, placeholder: UIImage? = nil, fadeIn: Bool = true, shouldCacheImage: Bool = true, closure: ((_ image: UIImage?) -> ())? = nil, expire: ((_ isExpire: Bool?) -> ())? = nil)
    {
        
        _ = UIImage.image(fromURL: url, placeholder: placeholder, shouldCacheImage: shouldCacheImage, closure: { (image, url) in
            
            if image == nil {
                return
            }
            self.setImage(image, for: .normal)
            //            self.setBackgroundImage(image, for: .normal)
            
            if fadeIn {
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = CATransitionType.fade
                self.layer.add(transition, forKey: nil)
            }
            closure?(image)
            
        }) { (isExPires) in
            expire?(isExPires)
        }
    }
}
