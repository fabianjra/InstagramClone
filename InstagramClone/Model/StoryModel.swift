//
//  StoryModel.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import Foundation

struct StoryModel: Identifiable {
    let id = UUID()
    var user: UserModel
    let isLive: Bool //Para cuando esté haciendo un en vivo, aparecerá una etiqueta en la foto de las historias.
    
    //Retorna self, porque esta funcion está dentro del Struct del modelo.
    static func getStories() -> [Self] {
        return UserModel.getUsers().map{
            
            //El isLive, lo toma de un generador aleatorio en base a un Array que contiene True o False.
            StoryModel(user: $0, isLive: ([true, false].randomElement())!)
        }
    }
}
