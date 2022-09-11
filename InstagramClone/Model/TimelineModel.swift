//
//  TimelineModel.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import Foundation

struct TimelineModel: Identifiable {
    let id = UUID()
    let photo: String
    let user: UserModel
    
    static func getPost() -> [Self] {
        
        //Itera del 1 al 10, creando varios objectos de TimelineModel
        return (1..<10).map{
            TimelineModel(photo: "post-\($0)", user: UserModel.getUsers().randomElement()!)
        }
    }
}
