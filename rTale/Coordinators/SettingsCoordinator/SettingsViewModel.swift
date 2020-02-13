//
//  SettingsViewModel.swift
//  rTale
//
//  Created by Sako Hovaguimian on 2/12/20.
//  Copyright © 2020 Sako Hovaguimian. All rights reserved.
//

protocol DismissSettingsVCDelegate: class {
    func dismissSettingsVC()
}

import UIKit

class SettingsViewModel {
    
    weak var dismissDelegate: DismissSettingsVCDelegate!
    
    public func handleDismissSettingsCoord() {
        self.dismissDelegate.dismissSettingsVC()
    }
    
    public func numberOfCells(_ section: Int) -> Int {
    
        switch section {
            case 0: return 5
            case 1: return 3
            case 2: return 1
            default: return 5
        }
        
    }
    
    public func headerTitleForCells(_ section: Int) -> String {
    
        switch section {
            case 0: return "Messages"
            case 1: return "Mail"
            case 2: return "Display"
            default: return "Power Saver Mode"
        }
        
    }
    
    public func rowDataForCells(_ section: Int) -> [String] {
    
        switch section {
            case 0: return ["Text", "Call", "Facetime", "SMS", "Something Else"]
            case 1: return ["Gmail", "Yahoo", "iCloud"]
            case 2: return ["Brightness"]
            default: return [ "Power Saver Mode"]
        }
        
    }
    
    
}
