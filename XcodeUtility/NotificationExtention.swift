//
//  NotificationExtention.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 11/5/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    public static let CartManagerDidUpdate: NSNotification.Name =  NSNotification.Name.init("CartManagerDidUpdate")
    public static let CartManagerCleared: NSNotification.Name =  NSNotification.Name.init("CartManagerCleared")
    public static let GeneralDataUpdated: NSNotification.Name =  NSNotification.Name.init("GeneralDataUpdated")
    public static let ShowProductDetailScreenFromSearch: NSNotification.Name =  NSNotification.Name.init("ShowProductDetailScreenFromSearch")
    public static let SearchScreenListUpdated: NSNotification.Name =  NSNotification.Name.init("SearchScreenListUpdated")


}
