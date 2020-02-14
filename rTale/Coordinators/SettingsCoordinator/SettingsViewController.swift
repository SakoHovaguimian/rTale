//
//  SettingsViewController.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/12/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import  Animo

class SettingsViewController: UIViewController, Storyboarded {
    
    let cellID = "cell"
    
    //MARK:- Properties
    
    private var settingsViewModel: SettingsViewModel!
    
    //MARK:- Views
    
    private let dimissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(dismissVC(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var settingsTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.delegate = self
        tv.dataSource = self
        tv.tableFooterView = UIView()
        tv.register(UINib(nibName: SettingsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return tv
    }()
    
    
    //MARK:- Life Cycle
    
    init(viewModel: SettingsViewModel) {
        self.settingsViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
    }
    
    //MARK:- @Objc Functions
    
    @objc private func dismissVC(sender: UIButton) {
        self.settingsViewModel.handleDismissSettingsCoord()
    }
    
    //MARK:- Helper Functions
    
    private func configureViews() {
        
        self.view.backgroundColor = .purplishBlack
        
        
        //DismissButton
        self.view.addSubview(self.dimissButton)
        
        self.dimissButton.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, right: self.view.rightAnchor, paddingTop: 15, paddingRight: 15, width: 32, height: 32)
        
        //TableView
        self.view.addSubview(self.settingsTableView)
        self.settingsTableView.anchor(top: self.dimissButton.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingBottom: 32, paddingRight: 32)
        
        
    }
    
}

    //MARK:- Extensions

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.settingsViewModel.numberOfCells(section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SettingsHeaderView(frame: CGRect(x: 0, y: 0, width: self.settingsTableView.frame.width, height: 50))
        headerView.text = self.settingsViewModel.headerTitleForCells(section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = self.settingsTableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell {
            
            let text = self.settingsViewModel.rowDataForCells(indexPath.section)[indexPath.row]
            let isOn = self.settingsViewModel.valueForSetting(text)
            
            cell.delegate = self
            cell.configure(text: text, isOn: isOn)
        
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.settingsTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SettingsViewController: UpdateUserDefaultsValueDelegate {
    
    func updateUserDefaultsValueFor(_ key: String, with value: Bool) {
        self.settingsViewModel.updateUserDefault(for: key, with: value)
    }
    
}
