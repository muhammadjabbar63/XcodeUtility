//
//  ImageViewExtension.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

public extension UIImageView {
    
    /**
     Loads an image from a URL. If cached, the cached image is returned. Otherwise, a place holder is used until the image from web is returned by the closure.
     
     - Parameter url: The image URL.
     - Parameter placeholder: The placeholder image.
     - Parameter fadeIn: Weather the mage should fade in.
     - Parameter closure: Returns the image from the web the first time is fetched.
     
     - Returns A new image
     */
    func imageFromURL(_ url: String, placeholder: UIImage? = nil, fadeIn: Bool = true, shouldCacheImage: Bool = true, shouldTemplate: Bool = false, closure: ((_ image: UIImage?,_ url:String) -> ())? = nil, expire: ((_ isExpire: Bool?) -> ())? = nil)
    {
        self.image = placeholder
      _ =  UIImage.image(fromURL: url, placeholder: placeholder, shouldCacheImage: shouldCacheImage, closure: { image, url in
            if image == nil {
                return
            }
            closure?(image,url)
        }, expire: expire!)
    }
}

