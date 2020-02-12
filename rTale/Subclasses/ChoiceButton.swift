//
//  ChoiceButton.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/9/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

import UIKit
import Animo

class ChoiceButton: UIButton {
    
    var text: String
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.alpha = self.isHighlighted ? 0.5 : 1
            }, completion: nil)
        }
    }
    
    init(text: String) {
        
        self.text = text
    
        super.init(frame: .zero)
        
        self.updateButton()
        
    }
    
    func updateButton() {
        
        self.backgroundColor = .eggShell
        self.clipsToBounds = true
        self.sizeToFit()
        self.rounded()
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
