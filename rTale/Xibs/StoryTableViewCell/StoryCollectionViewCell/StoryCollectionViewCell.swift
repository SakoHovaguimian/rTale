//
//  StoryCollectionViewCell.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    public var title: String? {
        didSet {
            self.titleLabel.text = self.title
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.configureViews()
        
    }
    
    private func configureViews() {
        self.clipsToBounds = true
        self.roundCorners(.allCorners, radius: 15)
        
        
    }

}
