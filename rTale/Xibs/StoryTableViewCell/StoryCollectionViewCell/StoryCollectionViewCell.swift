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
    
    public var story: Story? {
        didSet {
            self.configure()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.configureViews()
        
    }
    
    private func configure() {
        
        guard let story = self.story else { return }
        
        self.titleLabel.text = story.title
        self.storyImageView.image = UIImage(named: story.imageURL)
        
        self.progressBar.setProgress(story.progress, animated: true)
        self.progressBar.progressTintColor = .imgurGreen
        
    }
    
    private func configureViews() {
        
        self.clipsToBounds = true
        self.roundCorners(.allCorners, radius: 15)
        
    }

}
