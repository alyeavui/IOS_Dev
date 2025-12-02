//
//  MovieTableViewCell.swift
//  FavThings
//
//  Created by Ayaulym on 15.11.2025.
//

import UIKit

struct MovieItem {
    let title: String
    let subtitle: String
    let image: UIImage
    let review: String
}

class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var imageContainer: UIImageView!
    @IBOutlet private weak var reviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(movie: MovieItem) {
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        imageContainer.image = movie.image
        reviewLabel.text = movie.review
    }
}
