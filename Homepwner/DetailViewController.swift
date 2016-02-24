//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/24/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var serialNumberField: UITextField!

    @IBOutlet weak var valueField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!

    var item: Item! {
        
        didSet {
            
            navigationItem.title = item.name
            
        }
        
    }
    
    let numberFormatter: NSNumberFormatter = {
        
       let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
        
    }()
    
    let dateFormatter: NSDateFormatter = {
        
       let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        formatter.timeStyle = NSDateFormatterStyle.NoStyle
        return formatter
        
    }()
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        view.endEditing(true)
        item.name = nameField.text
        item.serialNumber = serialNumberField.text
        if let value = valueField.text {
            
            if let value = numberFormatter.numberFromString(valueField.text) {
                
                item.valueInDollars = value.integerValue
                
            } else {
                
                item.valueInDollars = 0
                
            }
            
        } else {
            
            item.valueInDollars = 0
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
    
        view.endEditing(true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDate" {
            
            let datePickerViewController = segue.destinationViewController as DatePickerViewController
            datePickerViewController.item = item
            
        }
        
    }
    
}
