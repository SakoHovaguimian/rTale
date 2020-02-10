//
//  HomeCoordinator.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

protocol DismissStoryCoordDelegate: class {
    func dismissStoryVC()
}

class StoryCoordinator: Coordinator {
    
    weak var delegate: DismissStoryCoordDelegate!
    
    public var story: Story!
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        
        self.getPlist(story.storyID)
        
        self.navigationController.modalPresentationStyle = .fullScreen
        self.navigationController.navigationBar.isHidden = true
        
        DispatchQueue.main.async {
            let viewModel = StoryViewModel(story: self.story)
            viewModel.dimissDelegate = self
            
            let storyVC = StoryViewController(viewModel: viewModel)
            
            self.navigationController.pushViewController(storyVC, animated: false)
        }
        
    }
    
    func getPlist(_ name: String) {

        guard let fileUrl = Bundle.main.url(forResource: name, withExtension: "plist") else { return }

        let fileData = try! Data(contentsOf: fileUrl)
        
        let story = try! PropertyListDecoder().decode(Story.self, from: fileData)
        
        self.story = story
        
    }
    
}

extension StoryCoordinator: DimissStoryVCDelegate {

    func dimissStoryVC() {
        self.delegate.dismissStoryVC()
    }
    
}
