//
//  HomeViewModel.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

//MARK:- Protocols

protocol PushSettingsPageDelegate: class {
    func pushSettingsPage(index: Int)
}

protocol PushStoryPageDelegate: class {
    func pushStoryPage(story: Story)
}

class HomeViewModel {
    
    weak var settingDelegate: PushSettingsPageDelegate!
    weak var storyDelegate: PushStoryPageDelegate!
    
    //MARK:- Properties
    
    static var storyCellHeight: CGFloat = 160.0
    
    private(set) var stories = [Story]()
    
    //MARK:- Helper Functions
    
    public func add(_ story: Story) {
        self.stories.append(story)
    }
    
    public func remove(at index: Int) {
        self.stories.remove(at: index)
    }
    
    public func handleSettingsPageTapped(index: Int) {
        self.settingDelegate.pushSettingsPage(index: index)
    }
    
    public func handleStoryTapped(story: Story) {
        self.storyDelegate.pushStoryPage(story: story)
    }
    
    public func generateTestData() {
        
        self.stories.append(contentsOf: [
        
            Story(storyID: "story_1", title: "The Paradox", author: "Sako Hovaguimian", genre: .scienceFiction, imageURL: "science"),
            Story(storyID: "story_1", title: "Solomon's Box", author: "Mitch Treece", genre: .fantasy, imageURL: "fantasy"),
            Story(storyID: "story_1", title: "LLC Destruction", author: "KC Gundserson", genre: .sliceOfLife, imageURL: "sliceOfLife"),
            
            Story(storyID: "story_1", title: "The Paradox", author: "Sako Hovaguimian", genre: .fantasy, imageURL: "fantasy"),
            Story(storyID: "story_1", title: "Solomon's Box", author: "Mitch Treece", genre: .fantasy, imageURL: "fantasy"),
            Story(storyID: "story_1", title: "LLC Destruction", author: "KC Gundserson", genre: .fantasy, imageURL: "fantasy"),
            
            Story(storyID: "story_1", title: "The Paradox", author: "Sako Hovaguimian", genre: .action, imageURL: "action"),
            Story(storyID: "story_1", title: "Solomon's Box", author: "Mitch Treece", genre: .action, imageURL: "action"),
            Story(storyID: "story_1", title: "LLC Destruction", author: "KC Gundserson", genre: .action, imageURL: "action"),
            
            Story(storyID: "story_1", title: "The Paradox", author: "Sako Hovaguimian", genre: .action, imageURL: "action"),
            Story(storyID: "story_1", title: "Solomon's Box", author: "Mitch Treece", genre: .action, imageURL: "action"),
            Story(storyID: "story_1", title: "LLC Destruction", author: "KC Gundserson", genre: .action, imageURL: "action")
            
        ])
        
    }

}
