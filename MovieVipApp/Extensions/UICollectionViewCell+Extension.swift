//
//  UICollectionViewCell+Extension.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 11.08.2021.
//

import UIKit


extension UICollectionViewCell {
    static var identifier: String {
        return String(describing:self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
