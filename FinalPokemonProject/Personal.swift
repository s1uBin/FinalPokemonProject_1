//
//  Personal.swift
//  FinalPokemonProject
//
//  Created by user on 5/1/2020.
//  Copyright © 2020 00557052. All rights reserved.
//

import SwiftUI
import MapKit
struct Personal: View {
    @State private var showSelectPhoto = false
    @State private var selectImage: UIImage?
    @State private var showWebpage = false
    @State private var likeScale: CGFloat = 1
    @State private var send = false
    var body: some View {
        VStack {
            Text("創作者資料")
            .font(.system(size: 40))
            .fontWeight(.black)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            Text("個人頭像")
            .font(.system(size: 21))
            .fontWeight(.bold)
            Button(action: {
                self.showSelectPhoto = true
            }) {
                Group {
                    if selectImage != nil {
                        Image(uiImage: selectImage!)
                            .resizable()
                            .renderingMode(.original)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                    }
                }
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                Spacer()
                
            }
            .sheet(isPresented: $showSelectPhoto) {
                ImagePickerController(selectImage: self.$selectImage, showSelectPhoto: self.$showSelectPhoto)
            }
            HStack{
            Text("性名")
                .font(.system(size: 20))
                           .fontWeight(.black)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(5)
                Text("WongWaiPan")
            }
            HStack{
            Text("學號")
                .font(.system(size: 20))
                           .fontWeight(.black)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(5)
                Text("00557052     ")
            }
           HStack{
            Text("學校")
                .font(.system(size: 20))
                           .fontWeight(.black)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(5)
                Text("NTOU            ")

            }
            MapView(coordinate: CLLocationCoordinate2D(latitude: 25.1505447, longitude: 121.7735869))
                           .frame(width: 200, height: 200)
            HStack{
            Text("指導老師")
                .font(.system(size: 20))
                           .fontWeight(.black)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(5)
                Button("帥氣Peter")
                {
                    self.showWebpage = true
                }
                    .font(.system(size: 40))
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                        .contextMenu{
                            Button(action: {
                                self.likeScale = 5
                                self.send = true
                            }){
                                Text("讚👍讚👍讚👍讚👍")
                                Image(systemName:"suit.heart.fill").imageScale(.large)
                            }
                            Button(action: {
                                self.likeScale = 10
                                self.send = true
                            }){
                                Text("十分讚👍十分讚👍")
                                Image(systemName:"suit.heart").imageScale(.large)
                            }
                    }
                .sheet(isPresented: $showWebpage) {
                    SafariViewController(url: URL(string: "https://www.facebook.com/iphone.peterpan/")!)
                }
                
                .alert(isPresented: self.$send){
                            ()->Alert in
                                
                    return Alert(title: Text("收到愛心！"),message: Text("感謝支持"), dismissButton: .default(Text("確認")))
                            
                    
                }
                
            }
            
        }
    }
}

struct Personal_Previews: PreviewProvider {
    static var previews: some View {
        Personal()
    }
}
