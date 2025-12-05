//
//  HeroService.swift
//  URLHeroRandomizer
//
//  Created by Ayaulym on 02.12.2025.
//

import Foundation

protocol HeroServiceDelegate: AnyObject {
    func onHeroDidUpdate(model: HeroModel)
}

struct HeroService {
    weak var delegate: HeroServiceDelegate?
    
    func fetchHero() async throws -> HeroModel {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        guard let url = URL(string: urlString) else{
            throw NetworkError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        do{
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print(response)
            let heroModel = try JSONDecoder().decode(HeroModel.self, from: data)
            return heroModel
        }
        catch {
            throw error
        }
    }
}

enum NetworkError: Error {
    case invalidURL
}
