//
//  MovieTableViewCell.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 5.08.2021.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var releaseResponseLabel: UILabel!
    @IBOutlet weak var voteAverageResponseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(viewModel:Movie.FetchMovies.ViewModel.DisplayedMovie){
        movieNameLabel.text = viewModel.movieName
        releaseResponseLabel.text = viewModel.releaseDate
        voteAverageResponseLabel.text = String(viewModel.voteAverage)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor(hex: "C9D8B6")
        
    }
    
    func configureCellImage(viewModel: Movie.FetchMovies.ViewModel.DisplayedMovie?) {
        movieImageView.sd_setImage(with:URL(string:viewModel?.movieImage ?? ""))
        
    }

}
