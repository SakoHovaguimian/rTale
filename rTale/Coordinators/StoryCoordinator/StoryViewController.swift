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
    
    private lazy var storyView: UIView = {
        
        let myView = UIView()
        myView.backgroundColor = .eggShell
        myView.clipsToBounds = true
        myView.layer.cornerRadius = 23
        
        myView.addSubview(self.storyLabel)
        
        self.storyLabel.centerX(inView: myView)
        self.storyLabel.anchor(top: myView.topAnchor, paddingTop: 20, width: 300, height: 200)
        
        
        return myView
            
    }()
    
    private var storyLabel: UITextView = {
        let label = UITextView()
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont(name: .gameFont, size: 15.0)
        label.frame.size = CGSize(width: 100, height: 400)
        return label
    }()

    private lazy var choicesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    //MARK:- LifeCycle
    
    init(viewModel: StoryViewModel) {
        self.storyViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        self.configureViews()
        self.view.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Objc Functions
    
    @objc private func storyButtonTapped(sender: UIButton) {
        self.storyViewModel.handleDismissTapped()
    }
    
    @objc private func nextPartOfStoryTapped(sender: UIButton) {
        
        //This will probabaly return a scene object and we can dynamically update the choies
        //Have number of choices accept a scene and loop over in it's own function
        self.storyViewModel.runloop(label: self.storyLabel)
        self.numnberOfChoices(choices: [
            "Turn Left",
            "Turn Right",
            "Stay Where You Are"
        ])
    }
    
    //MARK:- Helper Functions
    
    private func configureViews() {
        
        self.view.backgroundColor = UIColor(hex: "2A2E32")
        
        //Story View
        self.view.addSubview(self.storyView)
        self.storyView.anchor(top: self.view.topAnchor ,left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 64, paddingLeft: 32, paddingRight: 32, height: 350)
        self.storyView.centerX(inView: self.view)
        
        //Choices Stack View
        
        self.view.addSubview(self.choicesStackView)
        self.choicesStackView.anchor(top: self.storyView.bottomAnchor,
                              left: self.view.leftAnchor,
                              bottom: self.view.bottomAnchor,
                              right: self.view.rightAnchor,
                              paddingTop: 200,
                              paddingLeft: 32,
                              paddingBottom: 64,
                              paddingRight: 32)
        
    }
    
    public func numnberOfChoices(choices: [String]) {
        
        self.choicesStackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        
        for i in choices {
            
            let choiceButton = ChoiceButton(text: i)
            choiceButton.setTitleColor(.black, for: .normal)
            choiceButton.addTarget(self, action: #selector(self.nextPartOfStoryTapped(sender:)), for: .touchUpInside)
            self.choicesStackView.addArrangedSubview(choiceButton)
                        
        }

    }
    
}

