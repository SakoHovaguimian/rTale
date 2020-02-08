//
//  HomeCoordinator.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        
        let viewModel = HomeViewModel()
        
        let homeVC = HomeViewController(viewModel: viewModel)
        homeVC.storyDelegate = self
        homeVC.settingDelegate = self
        
        self.navigationController.modalPresentationStyle = .fullScreen
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(homeVC, animated: false)
        
    }
    
}

extension HomeCoordinator: PushSettingsPageDelegate {
    
    func pushSettingsPage(_ vc: HomeViewController, index: Int) {
        
        let testVC = UIViewController()
        testVC.view.backgroundColor = index == 0 ? .purplishBlack : .secondarySystemGroupedBackground
        
        self.navigationController.present(testVC, animated: true)
        
    }
    
}

extension HomeCoordinator: PushStoryPageDelegate {
    
    func pushStoryPage(_ vc: HomeViewController, story: Story) {
        
        let testVC = UIViewController()
        testVC.view.backgroundColor = .regalPurple
        
        self.navigationController.present(testVC, animated: true)
        
    }
    
}
