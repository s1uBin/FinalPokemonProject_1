//
//  Game.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI

struct Game: View {
    
    @State private var offset = CGSize.zero
    @State private var newPosition = CGSize.zero
    @State private var scale: CGFloat = 1
    @State private var newScale: CGFloat = 1
    @State private var likeScale: CGFloat = 1
    
    var body: some View {
        VStack{
            Spacer()
            Image("小火龍")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .clipped()
                .contextMenu{
                    Button(action: {
                        self.likeScale = 5
                    }){
                        Text("Like")
                        Image(systemName:"suit.heart.fill").imageScale(.large)
                    }
            }
            .offset(offset)
            .gesture(DragGesture()
                .onChanged({ (value) in
                    self.offset = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                })
                .onEnded({ (value) in
                    self.newPosition = self.offset
                      self.newScale = self.scale
                })
            )
            
                 .scaleEffect(scale)
                 .gesture(MagnificationGesture()
                     .onChanged({ (value) in
                         self.scale = self.newScale * value.magnitude
                     })
                     .onEnded({ (value) in
                         self.newScale = self.scale
                        self.newPosition = self.offset
                     })
                 )
            
            
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
