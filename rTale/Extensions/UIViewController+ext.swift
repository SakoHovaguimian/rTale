//
//  UIViewController+ext.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/9/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

typealias Outcome = (Scene?, Bool?)

extension UIViewController {
    
     func nextPartOfStory(_ nextScene: Scene, sender: UIButton, story: Story) -> Outcome {
        
        print(nextScene.choices![sender.tag])
        
        guard let nextScene = nextScene.choices?[sender.tag] else { return (nil, nil) }
        
        if nextScene.deadEnd == true {
            logMessage("💀💀💀💀💀💀 DEAD END")
            return (nil, true)
        }
        
        guard let destinationID = nextScene.destinationSceneId else { return (nil, nil) }
        
        print(destinationID)
        
        let path = story.scenes.contains(where: { $0.id == destinationID })
        
        print(story.scenes.contains(where: { $0.id == destinationID }))
        
        if path {
            return (story.scenes.filter({ $0.id == destinationID })[0], nil)
        }
        
        return (nil, nil)
        
    }
    
}
