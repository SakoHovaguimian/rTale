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
    
    private var storyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont(name: .gameFont, size: 15.0)
        label.frame.size = CGSize(width: 100, height: 400)
        label.numberOfLines = 0
        return label
    }()

    private lazy var choicesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.closeButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let healthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "heart")
        return imageView
    }()
    
    private let strengthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "strength")
        return imageView
    }()
    
    private let magicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "magic")
        return imageView
    }()
    
    private let healthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .gameFont, size: 12.0)
        label.textColor = .black
        label.text = "100"
        return label
    }()
    
    private let strengthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .gameFont, size: 12.0)
        label.textColor = .black
        label.text = "1"
        return label
    }()
    
    private let magicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .gameFont, size: 12.0)
        label.textColor = .black
        label.text = "2"
        return label
    }()
    
    private lazy var storyView: UIView = {
        
        let myView = UIView()
        myView.backgroundColor = .eggShell
        myView.clipsToBounds = true
        myView.layer.cornerRadius = 23
        
        myView.addSubview(self.storyLabel)
        
        self.storyLabel.centerX(inView: myView)
        self.storyLabel.anchor(top: myView.topAnchor,
                               left: myView.leftAnchor,
                               right: myView.rightAnchor,
                               paddingTop: 20,
                               paddingLeft: 20,
                               paddingRight: 20)
        
        
        return myView
            
    }()
    
    private lazy var statusBarView: UIView = {
        let statusView = UIView()
        statusView.backgroundColor = .eggShell
        
        statusView.addSubview(self.healthImageView)
        self.healthImageView.centerY(inView: statusView)
        self.healthImageView.anchor(left: statusView.leftAnchor, paddingLeft: 32, width: 24, height: 24)
        
        statusView.addSubview(self.healthLabel)
        self.healthLabel.centerY(inView: statusView)
        self.healthLabel.anchor(left: self.healthImageView.rightAnchor, paddingLeft: 8, width: 50, height: 24)
        
        statusView.addSubview(self.magicImageView)
        self.magicImageView.centerY(inView: statusView)
        self.magicImageView.anchor(left: self.healthLabel.rightAnchor, paddingLeft: 32, width: 24, height: 24)
        
        statusView.addSubview(self.magicLabel)
        self.magicLabel.centerY(inView: statusView)
        self.magicLabel.anchor(left: self.magicImageView.rightAnchor, paddingLeft: 8, width: 30, height: 24)
        
        statusView.addSubview(self.strengthImageView)
        self.strengthImageView.centerY(inView: statusView)
        self.strengthImageView.anchor(left: self.magicLabel.rightAnchor, paddingLeft: 32, width: 24, height: 24)
        
        statusView.addSubview(self.strengthLabel)
        self.strengthLabel.centerY(inView: statusView)
        self.strengthLabel.anchor(left: self.strengthImageView.rightAnchor, paddingLeft: 8, width: 30, height: 24)
        
        return statusView
    }()
    
    
    //MARK:- LifeCycle
    
    init(viewModel: StoryViewModel) {
        self.storyViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
        self.storyViewModel.getPlist {
            self.configureViews()
            
            self.numnberOfChoices(choices: ["Start"])
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.storyViewModel.getPlist {
            self.configureViews()
            
            self.numnberOfChoices(choices: ["Start"])
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Objc Functions
    
    @objc private func storyButtonTapped(sender: UIButton) {
        self.storyViewModel.handleDismissTapped()
    }
    
    @objc private func nextPartOfStoryTapped(sender: UIButton) {
        self.configureStory(senderID: sender.tag)
    }
    
    @objc private func closeButtonTapped(sender: UIButton) {
        self.storyViewModel.handleDismissTapped()
    }
    
    //MARK:- Helper Functions
    
    private func configureViews() {
        
        self.view.backgroundColor = UIColor(hex: "2A2E32")
        
        //Close Button
        self.view.addSubview(self.closeButton)
        self.closeButton.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, right: self.view.rightAnchor, paddingTop: 16, paddingRight: 16, width: 100, height: 32)
        
        //Story View
        self.view.addSubview(self.storyView)
        self.storyView.anchor(top: self.closeButton.topAnchor ,left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 64, paddingLeft: 32, paddingRight: 32, height: 350)
        self.storyView.centerX(inView: self.view)
        
        //Choices Stack View
        self.view.addSubview(self.choicesStackView)
        self.choicesStackView.anchor(top: self.storyView.bottomAnchor,
                              left: self.view.leftAnchor,
                              right: self.view.rightAnchor,
                              paddingTop: 130,
                              paddingLeft: 32,
                              paddingRight: 32)
        
        //Status Bar View
        self.view.addSubview(self.statusBarView)
        
        self.statusBarView.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 60)
        
        
    }
    
    public func numnberOfChoices(choices: [String]) {
        
        self.choicesStackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        
        var tag = 0
        
        for i in choices {
            
            let choiceButton = ChoiceButton(text: i)
            choiceButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60)
            choiceButton.tag = tag
            choiceButton.setTitleColor(.black, for: .normal)
            choiceButton.addTarget(self, action: #selector(self.nextPartOfStoryTapped(sender:)), for: .touchUpInside)
            choiceButton.titleLabel?.font = UIFont(name: .gameFont, size: 10.0)
            choiceButton.clipsToBounds = true
            choiceButton.setDimmensions(height: 60, width: self.view.frame.width)
            self.choicesStackView.addArrangedSubview(choiceButton)
            
            tag += 1
                        
        }

    }
    
    private func configureStory(senderID: Int = 0) {
        
        if let health = self.storyViewModel.currentScene?.choices?[senderID].health {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.healthImageView.alpha = 0.5
                
            }) { (_) in
                
                UIView.animate(withDuration: 0.3) {
                    self.healthImageView.alpha = 1.0
                    self.healthLabel.text = "\(health)"
                }
                
            }
            
        }
        
        self.storyViewModel.runloop(label: self.storyLabel, senderID: senderID)
               
        if let choices = self.storyViewModel.currentScene?.choices?.map({ $0.text}) {
           
            self.numnberOfChoices(choices: choices)
           
       }
    }
    
}

