//
//  ItemCell.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/24/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var serialNumberLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    func updateLabels() {
        
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        serialNumberLabel.font = caption1Font
        
    }
    
}
