//
//  StringExtention.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit

public enum DateTimeZone: String {
    /*** Time Zone for Dates ***/
    // For UTC time zone
    case UTC
    // For current time zone
    case CURRENT_TIME_ZONE
}
public enum DateTimeLocale: String {
    /*** Locale for Dates ***/
    // US English Locale (en_US)
    case en_US_POSIX
    // For Current locale
    case CURRENT_LOCALE
}
extension String {
    func dateString(displayFormatter displayFormate: String? = "yyyy-MM-dd HH:mm:ss",
                    displayTimeZone displayZone: DateTimeZone? = .UTC,
                    displayLocale localeIdentifier : DateTimeLocale = .en_US_POSIX) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = displayFormate
        dateFormatter.timeZone = displayZone == .CURRENT_TIME_ZONE ? TimeZone.current : TimeZone(identifier: displayZone!.rawValue)
        dateFormatter.locale = Locale(identifier: DateTimeLocale.en_US_POSIX.rawValue)
        if localeIdentifier == .CURRENT_LOCALE {
            dateFormatter.locale = Locale.current
        }
        return dateFormatter.date(from:self)!
    }
    func dateFromString(format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        if self == "0000-00-00 00:00:00" {
            return Date()
        }
        let utcDateFormatter = DateFormatter()
        utcDateFormatter.dateFormat = format
        utcDateFormatter.locale = Locale.current
        //utcDateFormatter.timeZone = TimeZone.current
        utcDateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        let utcDate = utcDateFormatter.date(from: self)
//        print("utc: \(String(describing: utcDate))")
        return utcDate!
    }
    func dateStringFromString(readFormatter readFormate: String = "yyyy-MM-dd HH:mm:ss",
                              displayFormatter displayFormate: String? = "MMMM dd\(NSLocalizedString(",", comment: "")) yyyy",
                              readTimeZone readZone: DateTimeZone? = .UTC,
                              displayTimeZone displayZone: DateTimeZone? = .CURRENT_TIME_ZONE) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = readZone == .CURRENT_TIME_ZONE ? TimeZone.current : TimeZone(identifier: readZone!.rawValue)
        
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = readFormate
        if let date = dateFormatter.date(from: self) {
            dateFormatter.timeZone = displayZone == .CURRENT_TIME_ZONE ? TimeZone.current : TimeZone(identifier: displayZone!.rawValue)
            dateFormatter.dateFormat = displayFormate //"MMMM dd, yyyy"
            
            dateFormatter.locale = Locale.current
            
            return dateFormatter.string(from: date)
        }
        return self
    }
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    func containsSpecialCheracters() -> Bool {
        
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
//            print("string contains special characters")
            return true
        }
        return false
    }
    func removeSpecialCharsFromString() -> String {
        
        let okayChars : Set<Character> = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890{}:,\"")
        return String(self.filter {okayChars.contains($0) })
    }

    func containsAlphanumericsCheracters() -> Bool {
        
        let characterset = CharacterSet.alphanumerics
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
//            print("string contains alphanumerics characters")
            return true
        }
        return false
    }
    func containsWhitespacesAndNewlinesCheracters() -> Bool {
        
        let characterset = CharacterSet.whitespacesAndNewlines
        if self.rangeOfCharacter(from: characterset.inverted) == nil {
            print("string contains whitespacesAndNewlines characters")
            return true
        }
        return false
    }
    func validEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" //"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    func nsRange(from range: Range<String.Index>) -> NSRange {
        guard let from = range.lowerBound.samePosition(in: utf16), let to = range.upperBound.samePosition(in: utf16) else { return NSRange() }
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from),
                       length: utf16.distance(from: from, to: to))
    }
    
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    func withBoldText(boldPartsOfString: Array<NSString>, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        
        let nonBoldFontAttribute = [ NSAttributedString.Key.font:font!]
        let boldFontAttribute = [ NSAttributedString.Key.font:boldFont!]
        let boldString = NSMutableAttributedString(string: self as String, attributes:nonBoldFontAttribute)
        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(boldFontAttribute, range: (self as NSString).range(of: boldPartsOfString[i] as String))
        }
        return boldString
    }
    
    var lowercaseFirst: String  {
        return String(prefix(1)).lowercased() + String(dropFirst())
    }
    func convertAttributedString(font : UIFont = UIFont.systemFont(ofSize: 13), color: UIColor = UIColor.init(hex: 0x929496))-> NSMutableAttributedString {
        let itemsFoundString = String(format:"%@", self)
        
        let myMutableString = NSMutableAttributedString(string: itemsFoundString, attributes: [:])
        
        myMutableString.addAttribute( NSAttributedString.Key.font,
                                     value: font,
                                     range: NSRange(location: 0, length: itemsFoundString.count))
        
        myMutableString.addAttribute( NSAttributedString.Key.foregroundColor,
                                     value: color,
                                     range: NSRange(location:0, length: itemsFoundString.count))
        
        
//        myMutableString.addAttribute( NSAttributedString.Key.underlineStyle,
//                                     value: 1,
//                                     range: NSRange(location: 0, length: itemsFoundString.count))
        
        
        return myMutableString
    }
    
    func  parseJSONString()-> Any? {
            
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
            
            if let jsonData = data {
                // Will return an object or nil if JSON decoding fails
                return try? JSONSerialization.jsonObject(with: jsonData, options: [])
            } else {
                // Lossless conversion of the string was not possible
                return nil
            }
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
extension NSMutableAttributedString {
    
    // Usage:
    // let noSpaceAttributedString = attributedString.trimmedAttributedString(set: CharacterSet.whitespacesAndNewlines)

    func trimmedAttributedString(set: CharacterSet) -> NSMutableAttributedString {
        
        let invertedSet = set.inverted
        
        var range = (string as NSString).rangeOfCharacter(from: invertedSet)
        let loc = range.length > 0 ? range.location : 0
        
        range = (string as NSString).rangeOfCharacter(
            from: invertedSet, options: .backwards)
        //let len = (range.length > 0 ? NSMaxRange(range) : string.characters.count) - loc
        let len = (range.length > 0 ? NSMaxRange(range) : string.count) - loc
        
        let r = self.attributedSubstring(from: NSMakeRange(loc, len))
        return NSMutableAttributedString(attributedString: r)
    }
    
    public func setAsLink(textToFind:String, linkURL:String) -> Bool {
        
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute( NSAttributedString.Key.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}

