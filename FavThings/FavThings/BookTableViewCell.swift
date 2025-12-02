//
//  BookTableViewCell.swift
//  FavThings
//
//  Created by Ayaulym on 21.11.2025.
//

import UIKit

struct BookItem {
    let bookCover: UIImage
    let bookTitle: String
    let bookAuthor: String
    let bookReview: String
}
class BookTableViewCell: UITableViewCell{
    @IBOutlet private weak var bookCoverImageView: UIImageView!
    @IBOutlet private weak var bookTitleLabel: UILabel!
    @IBOutlet private weak var bookAuthorLabel: UILabel!
    @IBOutlet private weak var bookReviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(movie: BookItem) {
        bookCoverImageView.image = movie.bookCover
        bookTitleLabel.text = movie.bookTitle
        bookAuthorLabel.text = movie.bookAuthor
        bookReviewLabel.text = movie.bookReview
    }
}
