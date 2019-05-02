//
//  UICollectionViewEx.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit

extension UICollectionView  {
    func registerNib(nibName: String, identifier: String? = nil) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: identifier ?? nibName)
    }
    func registerNibForSupplementryViewOfKind(nibName: String, kind:String = UICollectionView.elementKindSectionHeader, identifier: String? = nil) {

        self.register(UINib(nibName: nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier ?? nibName)
    }
}
extension UITableView  {
    func registerNib(nibName: String, identifier: String? = nil) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: identifier ?? nibName)
    }
}
