//
//  SettingsTableViewCell.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/13/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

protocol UpdateUserDefaultsValueDelegate: class {
    func updateUserDefaultsValueFor(_ key: String, with value: Bool)
}

class SettingsTableViewCell: UITableViewCell {
    
    weak var delegate: UpdateUserDefaultsValueDelegate!
    
    static let identifier = "SettingsTableViewCell"

    @IBOutlet weak var toggleSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureToggleSwitch()

    }
    
    private func configureToggleSwitch() {
        
        self.backgroundColor = .clear
        
        self.toggleSwitch.backgroundColor = .black
        self.toggleSwitch.layer.cornerRadius = 16.0
        self.toggleSwitch.onTintColor = .imgurGreen
        self.toggleSwitch.addTarget(self, action: #selector(self.switchTapped(_:)), for: .valueChanged)
        
    }
    
    public func configure(text: String, isOn: Bool) {
    
        self.textLabel?.text = text
        self.toggleSwitch.isOn = isOn
        
    }
    
    @objc private func switchTapped(_ sender: UISwitch) {
        self.delegate.updateUserDefaultsValueFor(self.textLabel?.text ?? "", with: self.toggleSwitch.isOn)
    }
    
}
