//
//  HomeViewModel.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

class HomeViewModel {
    
    //MARK:- Properties
    
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
    
    public func generateTestData() {
        
        self.stories.append(contentsOf: [
        
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .scienceFiction),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .fantasy),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .sliceOfLife),
            
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .fantasy),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .fantasy),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .fantasy),
            
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .action),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .action),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .action),
            
            Story(id: 1, title: "The Paradox", author: "Sako Hovaguimian", genre: .action),
            Story(id: 2, title: "Solomon's Box", author: "Mitch Treece", genre: .action),
            Story(id: 3, title: "LLC Destruction", author: "KC Gundserson", genre: .action)
            
        ])
        
    }
    
}
