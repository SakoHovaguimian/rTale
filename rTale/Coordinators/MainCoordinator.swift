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
        
        homeCoord.start()
        
        self.navigationController.present(nc, animated: false, completion: nil)
        
        self.childCoordinators.append(homeCoord)
    
        
    }

}
