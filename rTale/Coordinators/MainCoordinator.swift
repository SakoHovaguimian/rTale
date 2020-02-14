//
//  MainCoordinator.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        
        let nc = UINavigationController()
        let homeCoord = HomeCoordinator(navigationController: nc)
        
        homeCoord.delegate = self
        homeCoord.settingsDelegate = self
        
        homeCoord.start()
        
        self.navigationController.present(nc, animated: false, completion: nil)
        
        self.childCoordinators.append(homeCoord)
        
    }

}

extension MainCoordinator: PresentStoryCoordDelegate {
    
    func presentStoryPage(story: Story) {
        
        let nc = UINavigationController()
        let storyCoord = StoryCoordinator(navigationController: nc)
        
        storyCoord.story = story
        storyCoord.start()
        storyCoord.delegate = self
        
        self.childCoordinators.last?.navigationController.present(nc, animated: true, completion: nil)
        
        self.childCoordinators.append(storyCoord)
        
    }
    
}

extension MainCoordinator: PresentSettingsPageDelegate {
    
    func presentSettingsPage() {
        
        let nc = UINavigationController()
        let settingsCorrd = SettingsCoordinator(navigationController: nc)
        
        settingsCorrd.start()
        settingsCorrd.dismissDelegate = self
        
        self.childCoordinators.last?.navigationController.present(nc, animated: true, completion: nil)
        
        self.childCoordinators.append(settingsCorrd)
        
    }
    
}

extension MainCoordinator: DismissSettingsCoordinatorDelegate {
    
    func dismissSettingsCoord() {
        self.childCoordinators.last?.navigationController.dismiss(animated: true, completion: nil)
        self.childCoordinators.removeLast()
    }
    
}

extension MainCoordinator: DismissStoryCoordDelegate {
    
    func dismissStoryVC() {
        self.childCoordinators.last?.navigationController.dismiss(animated: true, completion: nil)
        self.childCoordinators.removeLast()
    }
    
}
