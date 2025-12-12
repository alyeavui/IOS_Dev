//
//  ViewController.swift
//  HeroRandomizerAlamofire
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
    
    var heroService = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        heroService.delegate = self
        setupInitialHero()
    }

    @IBAction private func rollDidTap() {
        heroService.fetchHero()
    }
}
extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel) {
        configure(model: model)
        storeLocally(model: model)
    }

    private func configure(model: HeroModel) {
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

    private func storeLocally(model: HeroModel) {
        let heroData = try? PropertyListEncoder().encode(model)
        UserDefaults.standard.set(heroData, forKey: "heroData")
    }

    private func setupInitialHero() {
        guard
            let heroData = UserDefaults.standard.data(forKey: "heroData"),
            let heroModel = try? PropertyListDecoder().decode(HeroModel.self, from: heroData)
        else {
            return
        }

        configure(model: heroModel)
    }
}
