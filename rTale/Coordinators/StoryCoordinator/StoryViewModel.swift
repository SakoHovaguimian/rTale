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
    
    //MARK:- Helper Functions
    
    public func getStory() -> Story {
        return self.story
    }
    
    public func handleDismissTapped() {
        self.dimissDelegate.dimissStoryVC()
    }
    

}
