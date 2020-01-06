//
//  SongDetail.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI
import AVKit

struct SongDetail: View {
    var song: Song
    @State private var player: AVPlayer?
    
    var body: some View {
        
        VStack {
            Text(song.trackName)
            Button(action: {
                self.player = AVPlayer(url: self.song.previewUrl)
                self.player?.play()
                
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
        .onDisappear {
            self.player?.pause()
        }
    }
    
}

struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: Song(artistName: "", trackName: "Pokemon song", previewUrl: URL(string: "https://cdn2.thecatapi.com/images/6ph.jpg")!, artworkUrl100: URL(string: "https://cdn2.thecatapi.com/images/6ph.jpg")!, trackPrice: 1, collectionName: "aa"))
    }
}
