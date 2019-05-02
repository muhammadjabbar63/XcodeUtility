//
//  UIViewExtensions.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit

private var vBorderColour: UIColor = UIColor.white
private var vCornerRadius: CGFloat = 0.0
private var vBorderWidth: CGFloat = 0.0
private var vMasksToBounds: Bool = true
private var vMakeCircle: Bool = false


@IBDesignable class UIView_Category: UIView   {
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.setNeedsLayout()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if makeCircle   {
            layer.cornerRadius = self.bounds.width / 2
        }
        else    {
            layer.cornerRadius = cornerRadius
        }
        layer.borderColor = vBorderColour.cgColor
        layer.borderWidth = vBorderWidth
        layer.masksToBounds = vMasksToBounds
        self.layoutIfNeeded()
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        self.layoutIfNeeded()
    }
    
    
}


extension UIView    {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return vCornerRadius
        }
        set {
            layer.cornerRadius = newValue
            vCornerRadius = newValue
            self.setNeedsLayout()

        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return vBorderWidth
        }
        set {
            layer.borderWidth = newValue
            vBorderWidth = newValue
            self.setNeedsLayout()

        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return vMasksToBounds
        }
        set {
            layer.masksToBounds = newValue
            vMasksToBounds = newValue
            self.setNeedsLayout()

        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get{
            
            return vBorderColour
        }
        set {
            
            layer.borderColor = newValue.cgColor
            vBorderColour = newValue
            self.setNeedsLayout()

        }
    }
    
    @IBInspectable var makeCircle: Bool {
        get{
            
            return vMakeCircle
        }
        set {
            
            if newValue  {
                cornerRadius = frame.size.width / 2
                masksToBounds = true
            }
            else    {
                cornerRadius = vCornerRadius
                masksToBounds = vMakeCircle
            }
            vMakeCircle = newValue
            self.setNeedsLayout()

        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
                self.setNeedsLayout()
            }
        }
    }
    
    func centerInSuperview() {
        self.centerHorizontallyInSuperview()
        self.centerVerticallyInSuperview()
        self.setNeedsLayout()

    }
    func equalAndCenterToSupper() {
        
        self.centerHorizontallyInSuperview()
        self.centerVerticallyInSuperview()
        leadingInSuperview()
        trailingInSuperview()
        topInSuperview()
        bottomInSuperview()
        self.setNeedsLayout()

        
    }
    func centerHorizontallyInSuperview(constant: CGFloat = 0){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: self.superview, attribute: .centerX, multiplier: 1, constant: constant)
        self.superview?.addConstraint(c)
    }
    
    func centerVerticallyInSuperview(){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: self.superview, attribute: .centerY, multiplier: 1, constant: 0)
        self.superview?.addConstraint(c)
    }
    func leadingInSuperview(constant: CGFloat = 0){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute:.leadingMargin, relatedBy: .equal, toItem: self.superview, attribute: .leadingMargin, multiplier: 1, constant: constant)
        self.superview?.addConstraint(c)
    }
    func trailingInSuperview(constant: CGFloat = 0){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute:.trailingMargin, relatedBy: .equal, toItem: self.superview, attribute: .trailingMargin, multiplier: 1, constant: constant)
        self.superview?.addConstraint(c)
    }
    func topInSuperview(constant: CGFloat = 0){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute:.topMargin, relatedBy: .equal, toItem: self.superview, attribute: .topMargin, multiplier: 1, constant: constant)
        self.superview?.addConstraint(c)
    }
    func bottomInSuperview(constant: CGFloat = 0){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute:.bottomMargin, relatedBy: .equal, toItem: self.superview, attribute: .bottomMargin, multiplier: 1, constant: constant)
        self.superview?.addConstraint(c)
    }
    
    class func fromNib<T : UIView>() -> T {
        
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}


