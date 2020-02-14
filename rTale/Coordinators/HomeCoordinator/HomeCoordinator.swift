//
//  HomeCoordinator.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

protocol PresentStoryCoordDelegate: class {
    func presentStoryPage(story: Story)
}

protocol PresentSettingsPageDelegate: class {
    func presentSettingsPage()
}

class HomeCoordinator: Coordinator {
    
    weak var delegate: PresentStoryCoordDelegate!
    weak var settingsDelegate: PresentSettingsPageDelegate!
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        
        let viewModel = HomeViewModel()
        viewModel.settingDelegate = self
        viewModel.storyDelegate = self
        
        let homeVC = HomeViewController(viewModel: viewModel)
        
        self.navigationController.modalPresentationStyle = .fullScreen
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(homeVC, animated: false)
        
    }
    
}

extension HomeCoordinator: PushSettingsPageDelegate {
    
    func pushSettingsPage(index: Int) {
        self.settingsDelegate.presentSettingsPage()
    }
    
}

extension HomeCoordinator: PushStoryPageDelegate {
    
    func pushStoryPage(story: Story) {
        self.delegate.presentStoryPage(story: story)
    }
    
}
