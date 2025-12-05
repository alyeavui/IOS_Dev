//
//  HeroModel.swift
//  URLHeroRandomizer
//
//  Created by Ayaulym on 02.12.2025.
//

struct HeroModel: Decodable{
    let id: Int
    let name: String
    let images: HeroImage
    let powerstats: Powerstats
    let appearance: Appearance
    
    struct HeroImage: Decodable {
        let md: String
    }
    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    struct Appearance: Decodable {
        let gender: String
        let race: String
    }
}
