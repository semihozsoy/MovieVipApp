//
//  UICollectionView+Extension.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 11.08.2021.
//

import UIKit

extension UICollectionView {
    func register(cellType:UICollectionViewCell.Type){
        register(cellType.nib,forCellWithReuseIdentifier: cellType.identifier)
    }
    func dequeCell<T:UICollectionViewCell>(cellType:T.Type,indexPath:IndexPath)->T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}
