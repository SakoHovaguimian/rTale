//
//  StoryTableViewCell.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/6/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit

protocol PassChosenStoryDelegate: class {
    func passChosenStory(_ story: Story)
}

class StoryTableViewCell: UITableViewCell {
    
    static let identifier = "StoryTableViewCell"
    
    weak var delegate: PassChosenStoryDelegate!
    
    //MARK:- Properties
    
    var stories = [Story]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    //MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.configureCollectionView()
        
    }
    
    //MARK:- Helper Functions

    private func configureCollectionView() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.clipsToBounds = true
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 32)
        self.collectionView.register(UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
    }
    
}

//MARK:- Collection View Delegate & DataSource

extension StoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell {

            cell.story = self.stories[indexPath.row]
    
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 64, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.passChosenStory(self.stories[indexPath.row])
    }
    
    
}

