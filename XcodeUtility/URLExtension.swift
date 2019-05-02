//
//  URLExtension.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import Foundation

public extension URL {

    static func clearCacheAndCookies() {
        
        // Remove all cache
        URLCache.shared.removeAllCachedResponses()
        
        // Delete any associated cookies
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }

    }

}
