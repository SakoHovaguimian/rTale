//
//  User.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/9/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import Foundation

class User: Codable {
    
    var id: Int
    var name: String
    var email: String
    
    var characterName: String
    
    init(id: Int, name: String, email: String, characterName: String) {
        self.id = id
        self.name = name
        self.email = email
        self.characterName = characterName
    }
    
}
