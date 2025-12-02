//
//  MusicTableViewCell.swift
//  FavThings
//
//  Created by Ayaulym on 21.11.2025.
//

import UIKit

struct MusicItem {
    let cover: UIImage
    let title: String
    let artist: String
    let releaseYear: String
}

class MusicTableViewCell: UITableViewCell {
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var releaseYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(music: MusicItem) {
        coverImageView.image = music.cover
        titleLabel.text = music.title
        artistLabel.text = music.artist
        releaseYearLabel.text = music.releaseYear
    }
}
