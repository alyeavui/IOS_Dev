//
//  ViewController.swift
//  URLHeroRandomizer
//
//  Created by Ayaulym on 02.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroIntelligence: UILabel!
    @IBOutlet private weak var heroStrength: UILabel!
    @IBOutlet private weak var heroSpeed: UILabel!
    @IBOutlet private weak var heroDurability: UILabel!
    @IBOutlet private weak var heroPower: UILabel!
    @IBOutlet private weak var heroCombat: UILabel!
    @IBOutlet private weak var heroGender: UILabel!
    @IBOutlet private weak var heroRace: UILabel!
    
    var service = HeroService()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction private func getHeroes(){
        Task{ @MainActor in
            guard let model = try? await service.fetchHero() else {
                return
            }
            heroName.text = model.name
            heroImage.kf.setImage(with: URL(string: model.images.md))
            heroIntelligence.text = "Intelligence: \(model.powerstats.intelligence)"
            heroStrength.text = "Strength: \(model.powerstats.strength)"
            heroSpeed.text = "Speed: \(model.powerstats.speed)"
            heroDurability.text = "Durability: \(model.powerstats.durability)"
            heroPower.text = "Power: \(model.powerstats.power)"
            heroCombat.text = "Combat: \(model.powerstats.combat)"
            heroGender.text = "Gender: \(model.appearance.gender)"
            heroRace.text = "Race: \(model.appearance.race)"
        }
    }
    
}
