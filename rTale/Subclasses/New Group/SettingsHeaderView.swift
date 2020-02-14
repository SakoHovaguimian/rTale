//
//  SettingsHeaderView.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/13/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

class SettingsHeaderView: UIView {
    
    static let identifier = "SettingsHeaderView"
    
    var text: String = "" {
        didSet {
            self.headerTitle.text = self.text
        }
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    public func initialize() {
        Bundle.main.loadNibNamed("SettingsHeaderView", owner: self, options: nil)
        addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
