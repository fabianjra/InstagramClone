//
//  CommentModel.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import Foundation

struct CommentModel: Identifiable {
    let id = UUID()
    let comment: String
    
    static func getComments() -> [Self] {
        return [
            .init(comment: "Que bonito paisaje, me gust amucho"),
            .init(comment: "Que foto mas fea, mejor no siga tomando mas"),
            .init(comment: "WOW, quedé impactado con esa foto"),
            .init(comment: "AARRRHHGGG"),
            .init(comment: "jajaja recuerdo ese dia, te caiste"),
            .init(comment: "mmm..."),
        ]
    }
}
