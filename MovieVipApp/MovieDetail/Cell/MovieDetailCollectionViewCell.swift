//
//  MovieDetailCollectionViewCell.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 11.08.2021.
//

import UIKit

class MovieDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieGenreView: UIView!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with genreName:String) {
        movieGenreLabel.text = genreName
        movieGenreView.layer.cornerRadius = 15
        movieGenreView.layer.masksToBounds = true 
    }

}
