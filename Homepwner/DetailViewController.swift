//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/24/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var serialNumberField: UITextField!

    @IBOutlet weak var valueField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    
    var item: Item! {
        
        didSet {
            
            navigationItem.title = item.name
            
        }
        
    }
    
    var imageStore: ImageStore!
    
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
    
    // MARK: - View life cycle
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
        let key = item.itemKey
        let imageToDisplay = imageStore.imageForKey(key)
        imageView.image = imageToDisplay
        
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
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    // MARK: - Dismiss keyboard when click wherever
    
    @IBAction func backgroundTapped(sender: AnyObject) {
    
        view.endEditing(true)
        
    }
    
    // MARK: - Methods for Bar Button Items
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
        } else {
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true) { () -> Void in
            
    
            
        }
        
    }
    
    @IBAction func removeImage(sender: UIBarButtonItem) {
        
        if let image = imageStore.imageForKey(item.itemKey) {
            
            imageStore.deleteImageForKey(item.itemKey)
            imageView.image = nil
            
        }
 
    }
    
    // MARK: - UIImagePickerController Delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        imageView.image = image
        imageStore .setImage(image, forKey: item.itemKey)
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // MARK: - Prepare for Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDate" {
            
            let datePickerViewController = segue.destinationViewController as DatePickerViewController
            datePickerViewController.item = item
            
        }
        
    }
    
}
