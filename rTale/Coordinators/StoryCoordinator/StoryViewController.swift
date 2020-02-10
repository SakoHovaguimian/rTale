//
//  HomeViewController.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

class StoryViewController: UIViewController, Storyboarded {
    
    //MARK:- Properties
    
    private var storyViewModel: StoryViewModel
    
    //MARK:- Views
    
    let myButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(storyButtonTapped(sender:)), for: .touchUpInside)
        
        return button
        
    }()
    
    let myLabel: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = .eggShell
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
    }()
    
    
    //MARK:- LifeCycle
    
    init(viewModel: StoryViewModel) {
        self.storyViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        self.configureViews()
        self.view.backgroundColor = .skyBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Helper Functions
    
    private func configureViews() {
        
        self.view.addSubview(self.myButton)
        
        self.myButton.centerX(inView: self.view)
        self.myButton.centerY(inView: self.view)
        self.myButton.setDimmensions(height: 50, width: 200)
        
        self.view.addSubview(self.myLabel)
        
        self.myLabel.centerX(inView: self.view)
        self.myLabel.anchor(bottom: self.myButton.topAnchor, paddingBottom: 45)
        self.myLabel.setDimmensions(height: 50, width: 200)
        
        self.myLabel.text = "\(self.storyViewModel.getStory().title)"
        
    }
    
    //MARK:- Objc Functions
    
    @objc private func storyButtonTapped(sender: UIButton) {
        self.storyViewModel.handleDismissTapped()
    }
    
}

