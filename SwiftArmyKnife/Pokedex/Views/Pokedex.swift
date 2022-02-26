//
//  Pokedex.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/16/22.
//

import SwiftUI

struct Pokedex: View {
    @StateObject var viewModel = PokedexModel()
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a Pokemon ID or name", text: $viewModel.searchTerm)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    Task {
                        await viewModel.fetchPokemonAndSprite()
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
            }
            if let pokemon = viewModel.pokemon {
                if let image = viewModel.sprite {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .accessibilityLabel("\(pokemon.name) sprite")
                }
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                Text("\(pokemon.id)")
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Pokedex")
    }
}

struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex()
    }
}
