//
//  ViewController.swift
//  GravityFallsRandomizer
//
//  Created by Ayaulym on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var randomButton: UIButton!
    let characters: [String : UIImage] = ["Dipper":UIImage(named: "dipper")!, "Mabel":UIImage(named: "mabel")!, "Stan":UIImage(named: "stan")!, "Soos":UIImage(named: "soos")!, "Wendy":UIImage(named: "wendy")!, "Bill":UIImage(named: "bill")!, "Ford":UIImage(named: "ford")!, "Pacifica":UIImage(named: "pacifica")!, "Gideon":UIImage(named: "gideon")!, "Waddles":UIImage(named: "waddles")!]
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImageView.layer.cornerRadius = 20
    }
    @IBAction func randomButtonTapped(_ sender:UIButton){
        if let randomCharacter = characters.randomElement() {
            characterName.text = randomCharacter.key
            characterImage.image = randomCharacter.value
        }
    }

}

