//
//  Story.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

enum Genre: Int, CaseIterable, Codable {
    case action, fantasy, sliceOfLife, scienceFiction
}

class Story: Codable {
    
    var id: Int
    var title: String
    var author: String
    var genre: Genre
    var imageURL: String
    var scenes = [Scene]()
    
    init(id: Int, title: String, author: String, genre: Genre, imageURL: String) {
        self.id = id
        self.title = title
        self.author = author
        self.genre = genre
        self.imageURL = imageURL
    }

    
}
