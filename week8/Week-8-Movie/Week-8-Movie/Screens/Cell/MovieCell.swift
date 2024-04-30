//
//  MovieCell.swift
//  Week-8-Movie
//
//  Created by Kerim Çağlar on 6.04.2024.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(nowPlaying: NowplayingMovieResult) {
        movieTitle.text = nowPlaying.title
        movieReleaseDate.text = nowPlaying.releaseDate
        guard let url = URL(string: Constant.imageBaseURL + (nowPlaying.backdropPath ?? "")) else { return }
        movieImageView.kf.setImage(with: url)
    }
    
}
