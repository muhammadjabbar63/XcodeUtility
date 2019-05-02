//
//  BundleExtension.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? "Not Available"
    }
    var buildVersionNumber: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? "Not Available"
    }
}
