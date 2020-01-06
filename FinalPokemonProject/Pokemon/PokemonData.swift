//
//  PokemonData.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//


struct Response: Decodable {
    let results: [PokemonRaw]
}

struct PokemonRaw: Decodable, Identifiable {
    var id: String {
        return name
    }
    let name: String
    let url: String
}

struct DetailedPokemon: Decodable {
    let id: Int
    let sprites: Sprite
    let types: [Types]
}

struct Sprite: Decodable {
    let front_default: String?

}

struct Types: Decodable, Identifiable {
    var id: Int {
        return slot
    }
    let slot: Int
    let type: Type
}

struct Type: Decodable {
    let name: String
    let url: String
}




import Foundation

class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    private init() { }
    
    @Published var pokemons = [PokemonRaw]()
    @Published var pokemon = DetailedPokemon(id: 123456, sprites: Sprite(front_default: nil), types: [Types(slot: 1, type: Type(name: "water", url: "123"))])
    
    func fetchPokemons() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=964#") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Response.self, from: safeData)
                        DispatchQueue.main.async {
                            self.pokemons = results.results
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            
        }
        task.resume()
    }
    
    func fetchPokemonDetails(with url: String) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let result = try decoder.decode(DetailedPokemon.self, from: safeData)
                        DispatchQueue.main.async {
                            self.pokemon = result
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            
        }
        task.resume()
    }
}
