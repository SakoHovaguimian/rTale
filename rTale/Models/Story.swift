//
//  Story.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

typealias Outcome = (Scene?, Bool?)

enum Genre: Int, CaseIterable, Codable {
    case action, fantasy, sliceOfLife, scienceFiction
}

class Story: Codable {
    
    var storyID: String
    var progress: Float = 0.5
    var title: String
    var author: String
    var genre: Genre
    var imageURL: String
    var scenes = [Scene]()
    
    init(storyID: String, title: String, author: String, genre: Genre, imageURL: String) {
        self.storyID = storyID
        self.title = title
        self.author = author
        self.genre = genre
        self.imageURL = imageURL
        self.progress = Float.random(in: 0...1.0)
    }
    
    private enum CodingKeys: String, CodingKey {
        case storyID = "story_id"
        case title
        case author
        case genre
        case imageURL
        case scenes
    }
    
    func nextPartOfStory(_ nextScene: Scene, filterBy: Int) -> Outcome {
        
        print(nextScene.choices![filterBy])
        
        guard let nextScene = nextScene.choices?[filterBy] else { return (nil, nil) }
        
        if nextScene.deadEnd == true {
            logMessage("💀💀💀💀💀💀 DEAD END")
            return (nil, true)
        }
        
        guard let destinationID = nextScene.destinationSceneId else { return (nil, nil) }
        
        print(destinationID)
        
        let path = self.scenes.contains(where: { $0.id == destinationID })
        
        print(self.scenes.contains(where: { $0.id == destinationID }))
        
        if path {
            return (self.scenes.filter({ $0.id == destinationID })[0], nil)
        }
        
        return (nil, nil)
        
    }
    
}
