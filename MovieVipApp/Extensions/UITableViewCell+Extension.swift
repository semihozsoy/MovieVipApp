//
//  UICollectionViewCell+Extension.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 6.08.2021.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
