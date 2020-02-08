//
//  Story.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

enum Genre: String, CaseIterable, Codable {
    case action, fantasy, sliceOfLife, scienceFiction
}

class Story: Codable {
    
    var id: Int
    var title: String
    var author: String
    var genre: Genre
    
    init(id: Int, title: String, author: String, genre: Genre) {
        self.id = id
        self.title = title
        self.author = author
        self.genre = genre
    }
    
}
