//
//  UILabelExtention.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit
import Foundation


extension UILabel   {
    func set(html htmlString: String) {
        do  {
            self.attributedText = try NSAttributedString.init(data: htmlString.data(using: .utf8)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
        }
        catch   {
            print("Error: \(error)")
        }
    }
    
    func decideTextDirection () {
        let tagScheme = [NSLinguisticTagScheme.language]
        let tagger    = NSLinguisticTagger(tagSchemes: tagScheme, options: 0)
        tagger.string = self.text
        let lang      = tagger.tag(at: 0, scheme: NSLinguisticTagScheme.language,
                                   tokenRange: nil, sentenceRange: nil)

        
        if lang?.rawValue.range(of: "ar") != nil {
            self.textAlignment = NSTextAlignment.right
        } else {
            self.textAlignment = NSTextAlignment.left
        }
    }
}
