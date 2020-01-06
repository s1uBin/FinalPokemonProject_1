//
//  PokemonMusicView.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI
import Foundation

struct PokemonMusicView: View {
    
    @State private var songs = [Song]()
    @State private var likeScale: CGFloat = 1
    
    
    func fetchSongs() {
      if let urlStr = "https://itunes.apple.com/search?term=pokemon&media=music".addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed){
            if let url = URL(string: urlStr) {
                URLSession.shared.dataTask(with: url) { (data, response , error) in
                    let decoder = JSONDecoder()
                    if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data) {
                        self.songs = songResults.results
                    }
                }.resume()
                
            }
        }

          
      }
    

    
     
     var body: some View {

         NavigationView {
             List(songs.indices, id: \.self) { (index)  in
                 NavigationLink(destination: SongDetail(song: self.songs[index])) {
                     SongRow(song: self.songs[index])
                    .contextMenu{
                    Button(action: {
                        self.songs.remove(at: index)
                             }){
                                 HStack{
                                     Text("Delete")
                                     Image(systemName: "trash")
                                 }
                       }
                        
                        Button(action: {
                            self.likeScale = 5
                        }){
                            Text("Like")
                            Image(systemName:"suit.heart.fill").imageScale(.large)
                        }
                        
                    }
                 }
                 
             }
             .onAppear {
                 if self.songs.count == 0 {
                     self.fetchSongs()

                 }
             }
            .navigationBarTitle("Pokemon音樂")
         }
         
     }
     
     
    
    
    
}

struct PokemonMusicView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonMusicView()
    }
}
