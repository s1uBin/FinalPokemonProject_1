//
//  Main.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI

struct Main: View {
    var body: some View {
        
        TabView{
            PokemonMusicView()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("主頁")
            }
            PokemonView()
                .tabItem{
                    Image(systemName:"house.fill")
                                       Text("寵物圖鑑")
            }
            Game()
                .tabItem{
                    Image(systemName: "questionmark")
                                    Text("玩玩手勢")
            }
            Personal()
                .tabItem{
                    Image(systemName: "house.fill")
                                    Text("個人資料")
            }
        }
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
