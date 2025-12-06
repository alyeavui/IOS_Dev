//
//  DetailViewController.swift
//  FavManagerApp
//
//  Created by Ayaulym on 06.12.2025.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    var item: FavouriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = item else { return }
        
        itemImageView.image = item.image
        titleLabel.text = item.title
        descriptionTextView.text = item.description
        reviewLabel.text = "My Review:\n\(item.review)"
    }
}
