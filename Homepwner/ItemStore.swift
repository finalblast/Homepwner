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
    
    func createItem() -> Item {
        
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
        
    }
    
    func removeItem(item: Item) {
        
        let index = find(allItems, item)
        
        if let position = index {
            
            allItems.removeAtIndex(position)
            
        }
        
    }
    
    func moveItemAtIndexPath(fromIndex: Int, toIndex: Int) {
        
        if fromIndex == toIndex {
            
            return
            
        }
        
        let movedItem = allItems[fromIndex]
        allItems.removeAtIndex(fromIndex)
        allItems.insert(movedItem, atIndex: toIndex)
        
    }
    
}
