//
//  ViewController.swift
//  DiceApp
//
//  Created by Ayaulym on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rhsDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    let diceImages: [UIImage] = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func rollButtonTapped(_ sender: UIButton){
        lhsDice.image = diceImages.randomElement()
        rhsDice.image = diceImages.randomElement()
    }
}

