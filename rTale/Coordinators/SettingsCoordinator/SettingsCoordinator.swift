//
//  SettingsCoordinator.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/12/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

protocol DismissSettingsCoordinatorDelegate: class {
    func dismissSettingsCoord()
}

class SettingsCoordinator: Coordinator {
    
    weak var dismissDelegate: DismissSettingsCoordinatorDelegate!
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        
        let viewModel = SettingsViewModel()
        viewModel.dismissDelegate = self
        
        let homeVC = SettingsViewController(viewModel: viewModel)
        
        self.navigationController.modalPresentationStyle = .fullScreen
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(homeVC, animated: false)
        
    }
    
}

extension SettingsCoordinator: DismissSettingsVCDelegate {
    
    func dismissSettingsVC() {
        self.dismissDelegate.dismissSettingsCoord()
    }
    
}
