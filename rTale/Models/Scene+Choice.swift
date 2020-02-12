//
//  Scene+Choice.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/9/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import Foundation

struct Scene: Codable {
    
    var id: String
    var text: String
    var choices: [Choice]?
    
}

struct Choice: Codable {
    
    var text: String
    var destinationSceneId: String?
    var deadEnd: Bool?
    var health: Int?
    
    private enum CodingKeys: String, CodingKey {
        
        case text
        case destinationSceneId = "scene_id"
        case deadEnd
        case health
        
    }
    
}
