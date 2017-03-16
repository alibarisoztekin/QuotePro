//
//  ModelClasses.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-03-15.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    let text: String
    let author: String
    
    init(text:String, author:String) {
        self.text = text
        self.author = author
        super.init()
    }
    
}


class Photo: NSObject {
    
    let image: UIImage
    init(image:UIImage) {
        self.image = image
        super.init()
    }
}

class UserQuote: NSObject {
    
    let quote:Quote
    let photo:Photo
    
    init(quote:Quote, photo:Photo) {
        self.quote = quote
        self.photo = photo
        super.init()
    }
    
    
}
