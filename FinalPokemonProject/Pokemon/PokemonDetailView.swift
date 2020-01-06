//
//  PokemonDetailView.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let url: String
    let name: String
    
    @ObservedObject var networkManager = NetworkManager.shared
    
    var body: some View {
        VStack {
            
            Text("Pokemon圖鑑")
            .font(.title)
            .fontWeight(.black)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(5)
            Text("寵物名： "+name)
                .font(.title)

            
           WebView(urlString: networkManager.pokemon.sprites.front_default)
               .frame(width: 300, height: 100, alignment: .center)
            
        
            
            Text("Pokemon ID: \(networkManager.pokemon.id )")
                .font(.subheadline)
            
            HStack {
                ForEach(networkManager.pokemon.types) { (index) in
                    Image("s_\(index.type.name)")

                }
            }
            
            Spacer()
        }
        .onAppear() {
            self.networkManager.fetchPokemonDetails(with: self.url)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(url: "https://pokeapi.co/api/v2/pokemon/21", name: "Spearow")
    }
}
