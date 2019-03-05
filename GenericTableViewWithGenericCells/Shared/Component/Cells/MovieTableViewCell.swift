//
//  MovieTableViewCell.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 04/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieArtistsStackView: UIStackView!
    
    func config(model: MovieModel) {
        movieTitleLabel.text = model.title
        movieReleaseYear.text = model.releaseYear
        movieImageView.image = UIImage(named: model.image)
        
        for view in movieArtistsStackView.subviews {
            movieArtistsStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for artist in model.artistsArray {
            let artistLabel = UILabel()
            artistLabel.text = artist
            movieArtistsStackView.addArrangedSubview(artistLabel)
        }
    }
}
