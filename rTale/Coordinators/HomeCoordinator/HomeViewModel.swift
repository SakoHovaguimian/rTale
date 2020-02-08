//
//  HomeViewModel.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

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
    
    private var stories = [Story]()
    
    //MARK:- Helper Functions
    
    public func getStories() -> [Story] {
        return self.stories
    }
    
    public func add(_ story: Story) {
        self.stories.append(story)
    }
    
    public func remove(at index: Int) {
        self.stories.remove(at: index)
    }
    
    public func getGenreAt(_ index: Int) -> [Story] {
        let genre = Genre.allCases[index]
        return self.stories.filter({ $0.genre == genre})
    }
    
    public func handleSettingsPageTapped(index: Int) {
        self.settingDelegate.pushSettingsPage(index: index)
    }
    
    public func handleStoryTapped(story: Story) {
        self.storyDelegate.pushStoryPage(story: story)
    }
    
    public func generateTestData() {
        
        self.stories.append(contentsOf: [
        
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .scienceFiction, imageURL: "science"),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .fantasy, imageURL: "fantasy"),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .sliceOfLife, imageURL: "sliceOfLife"),
            
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .fantasy, imageURL: "fantasy"),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .fantasy, imageURL: "fantasy"),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .fantasy, imageURL: "fantasy"),
            
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .action, imageURL: "action"),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .action, imageURL: "action"),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .action, imageURL: "action"),
            
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .action, imageURL: "action"),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .action, imageURL: "action"),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .action, imageURL: "action")
            
        ])
        
    }
    
}
