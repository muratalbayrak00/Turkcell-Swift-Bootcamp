//
//  PopularMovieCell.swift
//  MovieDBModular
//
//  Created by Kerim Çağlar on 4.05.2024.
//

import UIKit
import MovieAPI
import SDWebImage

class PopularMovieCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(movie: Movie) {
        let imagePath = "https://image.tmdb.org/t/p/w200\(movie.posterPath ?? "")"
        if let url = URL(string: imagePath) {
            imageView.sd_setImage(with: url)
        }
        label.numberOfLines = 0
        label.text = movie.title
    }
    
}
