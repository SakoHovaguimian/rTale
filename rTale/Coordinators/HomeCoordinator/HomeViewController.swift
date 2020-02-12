//
//  HomeViewController.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

class HomeViewController: UIViewController, Storyboarded {
    
    //MARK:- Properties
    
    private var homeViewModel: HomeViewModel
    private var homeTableView: UITableView?
    
    //MARK:- Views
    
    private lazy var headerView: UIView = {
    
        let headerView = UIView()
        headerView.backgroundColor = .black
        headerView.addSubview(self.stackView)
        
        self.stackView.anchor(top: headerView.topAnchor, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: headerView.rightAnchor)

        return headerView

    }()
    
    private var stackView: UIStackView = {
       
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10.0
        
        return stackView
        
    }()
    
    
    //MARK:- LifeCycle
    
    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        self.configureViews()
        self.view.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Helper Functions
    
    private func configureViews() {
        
        //HomeViewModel
        self.homeViewModel.generateTestData()
        
        //HeaderView
        self.view.addSubview(self.headerView)
        self.headerView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: 50)
        
        //StackView
        self.configureStackView()
        
        //HomeTableView
        self.homeTableView = UITableView()
        self.view.addSubview(self.homeTableView!)
        self.homeTableView?.anchor(top: self.headerView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingTop: 32, paddingLeft: 0, paddingBottom: 16, paddingRight: 0, width: nil, height: nil)
        
        self.configureTableView()
    }
    
    private func configureTableView() {
        
        self.homeTableView?.delegate = self
        self.homeTableView?.dataSource = self
        self.homeTableView?.tableFooterView = UIView()
        self.homeTableView?.backgroundColor = .black
        self.homeTableView?.layer.cornerRadius = 11
        self.homeTableView?.clipsToBounds = true
        self.homeTableView?.separatorStyle = .none
        self.homeTableView?.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        self.homeTableView?.register(UINib(nibName: StoryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: StoryTableViewCell.identifier)
        
    }
    
    private func configureStackView() {
        
        let button = UIButton(type: .system)
        button.setTitle("Test", for: .normal)
        button.sizeToFit()
        button.tag = 0
        button.rounded()
        button.backgroundColor = .eggShell
        button.addTarget(self, action: #selector(settingsButtonTapped(sender:)), for: .touchUpInside)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Test 2", for: .normal)
        button2.sizeToFit()
        button2.tag = 1
        button2.rounded()
        button2.backgroundColor = .eggShell
        button2.addTarget(self, action: #selector(settingsButtonTapped(sender:)), for: .touchUpInside)
        
        self.stackView.addArrangedSubview(button)
        self.stackView.addArrangedSubview(button2)
        
    }
    
    //MARK:- Objc Functions
    
    @objc private func settingsButtonTapped(sender: UIButton) {
        self.homeViewModel.handleSettingsPageTapped(index: sender.tag)
    }
}

//MARK:- TableView Delegate & DataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Genre.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let genre = Genre(rawValue: indexPath.section) else { return UITableViewCell() }
        
        let stories = self.homeViewModel.stories.filter { $0.genre == genre }
        
        if let cell = self.homeTableView?.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell {

            cell.stories = stories
            cell.delegate = self
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeViewModel.storyCellHeight
    }
    
}

//MARK:- Pass Chosen Story Delegate

extension HomeViewController: PassChosenStoryDelegate {
    
    func passChosenStory(_ story: Story) {
        self.homeViewModel.handleStoryTapped(story: story)
    }

}

