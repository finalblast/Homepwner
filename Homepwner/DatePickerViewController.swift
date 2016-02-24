//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/24/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var item: Item!
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        datePicker.setDate(item.dateCreated, animated: true)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        let date = datePicker.date
        item.dateCreated = date
        
    }
    
}
