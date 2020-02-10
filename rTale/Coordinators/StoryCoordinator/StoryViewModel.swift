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
    
    private var index = 0
    private var runloop = RunLoop.main
    private var inGuard = false
    
    //MARK:- Helper Functions
    
    public func getStory() -> Story {
        return self.story
    }
    
    public func handleDismissTapped() {
        self.dimissDelegate.dimissStoryVC()
    }
    
    public func nextPartOfStoryTestData(_ index: Int) -> String {
        
        var text = ""
        
        switch index {
            case 0: text = "What’s going on?"
            case 1: text = "How does everything feel so numb, yet so real."
            case 2: text = "Where am I? Am I floating?"
            case 3: text = "What’s this feeling? Someone’s holding me?"
            case 4: text = "It’s Like a warm hug. Like when I was younger"
            case 5: text = "This has to be a dream; I know you’re not with us anymore."
            case 6: text = "I need to find a way out!"
            default: text = "THE END"
        }
        return text
    }
    
     func runloop(label: UITextView) {
        
        let string = self.nextPartOfStoryTestData(self.index)
            
        guard self.inGuard == false else { return }
        
        self.inGuard = true
        
        self.runloop.cancelPerformSelectors(withTarget: self.runloop)
        self.runloop.cancelPerformSelectors(withTarget: self)
        
        self.index += 1
        
        label.text = ""
        outerLoop: for i in string {

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
