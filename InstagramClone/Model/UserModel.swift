//
//  UserModel.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import Foundation

struct UserModel : Identifiable{
    let id = UUID()
    let username: String
    let profilePicture: String
    let city: String
    let isVerified: Bool
    
    static func getUsers() -> [UserModel] {
        return [
            .init(username: "fabianjra", profilePicture: "person-1", city: "Tokyo, Japan", isVerified: true),
            .init(username: "Miguel", profilePicture: "person-2", city: "Guapiles, CR", isVerified: true),
            .init(username: "Beleida", profilePicture: "person-3", city: "San Ramon, CR", isVerified: false),
            .init(username: "Priscilla_RA", profilePicture: "person-4", city: "NJ, USA", isVerified: true),
            .init(username: "Josue", profilePicture: "person-5", city: "Sao Paolo", isVerified: false),
            .init(username: "Vanessa", profilePicture: "person-6", city: "Colombia", isVerified: false),
            .init(username: "someone", profilePicture: "person-7", city: "Brazil", isVerified: true),
            .init(username: "Fabian", profilePicture: "person-8", city: "Mexico", isVerified: true),
            .init(username: "Victor", profilePicture: "victorroldan.dev", city: "Caracas, venezuela", isVerified: false),
        ]
    }
}
