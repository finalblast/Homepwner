//
//  ImageStore.swift
//  Homepwner
//
//  Created by Nam (Nick) N. HUYNH on 2/25/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class ImageStore {
    
    let cache = NSCache()
    
    func setImage(image: UIImage, forKey key: String) {
        
        cache.setObject(image, forKey: key)
        
    }
    
    func imageForKey(key: String) -> UIImage? {
        
        return cache.objectForKey(key) as? UIImage
        
    }
    
    func deleteImageForKey(key: String) {
        
        cache.removeObjectForKey(key)
        
    }
    
}
