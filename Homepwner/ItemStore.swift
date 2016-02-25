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
    var itemArchiveURL: NSURL = {
        
       let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        let documentDirectory: AnyObject = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("item.archive")
        
    }()
    
    init() {
        
        if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item] {
            
            allItems += archivedItems
            
        }
        
    }
    
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
    
    func saveChanges() -> Bool {
        
        println("Saving item to: \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
        
    }
    
}
