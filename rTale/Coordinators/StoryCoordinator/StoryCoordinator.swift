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
        
        self.navigationController.modalPresentationStyle = .fullScreen
        self.navigationController.navigationBar.isHidden = true
        
        DispatchQueue.main.async {
            let viewModel = StoryViewModel()
            viewModel.addStory(story: self.story)
            viewModel.dimissDelegate = self
            
            let storyVC = StoryViewController(viewModel: viewModel)
            
            self.navigationController.pushViewController(storyVC, animated: false)
        }
        
    }
    
}

extension StoryCoordinator: DimissStoryVCDelegate {

    func dimissStoryVC() {
        self.delegate.dismissStoryVC()
    }
    
}
