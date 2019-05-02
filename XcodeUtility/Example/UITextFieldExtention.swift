//
//  UITextFieldExtentions.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit

extension UITextField {
    
    func placeholderColor(colour:UIColor) {
        
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder!,
                                                        attributes:[NSAttributedString.Key.foregroundColor: colour])
    }
    func isEmpty() -> Bool {
        return self.text!.isEmpty
    }
    
    func isValidUserName() -> Bool {
        if self.text!.count < 8 {
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        // check for email regs
        if self.text!.count < 8 {
            return true
        }
        return false
    }
}
