//
//  PokemonView.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI

struct PokemonView: View {
    
    @ObservedObject var networkManager = NetworkManager.shared
    
    var body: some View {
        NavigationView {
            List(networkManager.pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(url: pokemon.url, name: pokemon.name.capitalized)) {
                    HStack {
                        Text(String(pokemon.name.capitalized))
                            .font(.callout)
                    }
                }
            }
            .navigationBarTitle("Pokemon圖鑑")
        }
        .onAppear {
             if self.networkManager.pokemons.count == 0 {
            self.networkManager.fetchPokemons()
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
