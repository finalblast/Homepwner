//
//  FirstResponderTextField.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/24/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class FirstResponderTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        
        borderStyle = UITextBorderStyle.Line
        return super.becomeFirstResponder()
        
    }
    
    override func resignFirstResponder() -> Bool {
        
        borderStyle = UITextBorderStyle.RoundedRect
        return super.resignFirstResponder()
        
    }
    
}
