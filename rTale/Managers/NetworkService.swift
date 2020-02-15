//
//  NetworkService.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/13/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import Foundation

class NetworkService {
    
    
    static func fetchUser(bool: Bool, string: String) -> User {
        
        let user = User(id: 1,
                        name: "Sako Hovaguimian",
                        email: "Sako@fusionofideas.com",
                        characterName: "Druaga")
        
        return user
        
    }
    
    
}
