//
//  StoryCollectionViewCell.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

protocol UpdateStoryProgressDelegate: class {
    func updateStoryProgress(_ story: Story)
}

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    public var story: Story? {
        didSet {
            self.configure()
        }
    }
    
    weak var delegate: UpdateStoryProgressDelegate!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.configureViews()
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        self.delegate.updateStoryProgress(story!)
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
