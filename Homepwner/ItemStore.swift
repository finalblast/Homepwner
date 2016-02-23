//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/23/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        
        for _ in 0..<5 {
            
            createItem()
            
        }
        
    }
    
    func createItem() -> Item {
        
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
        
    }
    
}
