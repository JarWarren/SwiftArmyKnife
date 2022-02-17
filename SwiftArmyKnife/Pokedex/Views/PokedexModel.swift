//
//  PokedexModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/16/22.
//

import Foundation
import UIKit

@MainActor
class PokedexModel: ObservableObject {
    @Published var pokemon: Pokemon?
    @Published var sprite: UIImage?
    @Published var searchTerm = ""
    
    func fetchPokemonAndSprite() async {
        guard let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/"),
        !searchTerm.isEmpty else { return }
        let finalURL = baseURL.appendingPathComponent(searchTerm.lowercased())
        print(finalURL)
        
        do {
            // fetch pokemon data
            let (data, _) = try await URLSession.shared.data(from: finalURL)
            
            // decode pokemon
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            self.pokemon = pokemon
            
            // fetch image data
            let (imageData, _) = try await URLSession.shared.data(from: pokemon.sprites.frontDefault)
            
            // initialize image
            let sprite = UIImage(data: imageData)
            self.sprite = sprite
        } catch {
            print(error, error.localizedDescription)
        }
    }
}
