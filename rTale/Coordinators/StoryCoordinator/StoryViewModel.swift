//
//  HomeViewModel.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

protocol DimissStoryVCDelegate: class {
    func dimissStoryVC()
}

class StoryViewModel {
    
    init(story: Story) {
        self.story = story
    }
    
    //MARK:- Properties
    
    public var dimissDelegate: DimissStoryVCDelegate!
    
    private var story: Story!
    
    private var runloop = RunLoop.main
    private var inGuard = false
    
    public var currentScene: Scene?
    
    //MARK:- Helper Functions
    
    public func getStory() -> Story {
        return self.story
    }
    
    public func handleDismissTapped() {
        self.dimissDelegate.dimissStoryVC()
    }
    
    func runloop(label: UITextView, senderID: Int) {
        
        if self.currentScene == nil {
            self.currentScene = self.story.scenes[0]
        } else {
            self.currentScene = self.story.nextPartOfStory(self.currentScene!, filterBy: senderID).0
        }
        
        let text = self.currentScene?.text
            
        guard self.inGuard == false else { return }
        
        self.inGuard = true
        
        label.text = ""
        outerLoop: for i in text! {

            label.text! += "\(i)"
            
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 10
            let attributes = [NSAttributedString.Key.paragraphStyle : style, NSAttributedString.Key.font : UIFont(name: "PressStart2P", size: 15.0)]
            label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attributes as [NSAttributedString.Key : Any])
            
            if String(i) != "" {
                self.runloop.run(until: Date() + 0.050)
            }
            
        }
        
        self.inGuard = false
        
    }

}
