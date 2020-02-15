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
    
    //MARK:- Properties
    
    public var dimissDelegate: DimissStoryVCDelegate!
    
    private(set) var story: Story?
    
    private var runloop = RunLoop.main
    private var inGuard = false
    
    public var currentScene: Scene?
    
    //MARK:- Helper Functions
    
    public func addStory(story: Story) {
        self.story = story
    }
    
    public func handleDismissTapped() {
        self.dimissDelegate.dimissStoryVC()
    }
    
    func runloop(label: UILabel, senderID: Int, completion: @escaping () -> ()) {
        
        if self.currentScene == nil {
            self.currentScene = self.story?.scenes[0]
        } else {
            self.currentScene = self.story?.nextPartOfStory(self.currentScene!, filterBy: senderID).0
        }
        
        let text = self.currentScene?.text
            
        guard self.inGuard == false else { completion(); return }
        
        self.inGuard = true
        
        label.text = ""
        label.sizeToFit()
        
        guard text?.isEmpty == false else {
            self.inGuard = false
            completion()
            return
        }
        
        outerLoop: for i in text! {

            label.text! += "\(i)"
            label.sizeToFit()
            
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 10
            let attributes = [NSAttributedString.Key.paragraphStyle : style, NSAttributedString.Key.font : UIFont(name: .gameFont, size: 15.0)]
            label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attributes as [NSAttributedString.Key : Any])
            
            if String(i) != "" {
                self.runloop.run(until: Date() + 0.050)
            }
            
        }
        
        self.inGuard = false
        completion()
        
    }
    
    func getPlist(completion: @escaping () -> ()) {

        guard let fileUrl = Bundle.main.url(forResource: self.story?.storyID, withExtension: "plist") else { completion() ;return }

        let fileData = try! Data(contentsOf: fileUrl)
        
        let story = try! PropertyListDecoder().decode(Story.self, from: fileData)
        
        self.story = story
        completion()
        
    }

}
