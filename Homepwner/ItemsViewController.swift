//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/23/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    var numbersItemsWorthMoreThan50: [Item]!
    var numbersItemsWorthLessThan50: [Item]!
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        for value in 0..<itemStore.allItems.count {
            
            let item = itemStore.allItems[value]
            
            if item.valueInDollars >= 50 {
                
                numbersItemsWorthMoreThan50?.append(item)
                
            } else {
                
                numbersItemsWorthLessThan50?.append(item)
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        numbersItemsWorthMoreThan50 = [Item]()
        numbersItemsWorthLessThan50 = [Item]()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 1 && indexPath.row == numbersItemsWorthMoreThan50.count {
            
            return 44
            
        } else {
            
            return 100
            
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return numbersItemsWorthLessThan50.count
            
        } else {
            
            return numbersItemsWorthMoreThan50.count + 1
            
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 0 {
            
            let item = numbersItemsWorthLessThan50[indexPath.row]
            cell.textLabel.font = UIFont.systemFontOfSize(20)
            cell.textLabel.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            
        } else {
            
            if indexPath.row == numbersItemsWorthMoreThan50.count {
                
                cell.textLabel.font = UIFont.systemFontOfSize(16)
                cell.textLabel.text = "No more item!"
                cell.detailTextLabel?.text = ""
                
            } else {
                
                let item = numbersItemsWorthMoreThan50[indexPath.row]
                cell.textLabel.font = UIFont.systemFontOfSize(20)
                cell.textLabel.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
                
            }
            
        }
        
        return cell
        
    }
    
    @IBAction func addNewItem(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func toggleEdittingMode(sender: AnyObject) {
        
        if editing {
            
            sender.setTitle("Edit", forState: UIControlState.Normal)
            setEditing(false, animated: true)
            
        } else {
            
            sender.setTitle("Done", forState: UIControlState.Normal)
            setEditing(true, animated: true)
            
        }
        
    }

}
