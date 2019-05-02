//
//  UIStoryboard.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit


extension UIStoryboard {
    static func loadStoryBoard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}


