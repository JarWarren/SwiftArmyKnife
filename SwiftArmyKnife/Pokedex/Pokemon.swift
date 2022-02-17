//
//  Pokemon.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/16/22.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: PokemonSprites
    
    struct PokemonSprites: Decodable {
        let frontDefault: URL
    }
}

