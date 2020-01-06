//
//  SongData.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import Foundation

struct Song: Codable {
    var artistName: String
    var trackName: String
    var previewUrl: URL
    var artworkUrl100: URL
    var trackPrice: Double?
    var collectionName: String?

}

struct SongResults: Codable {
    var resultCount: Int
    var results: [Song]
}
