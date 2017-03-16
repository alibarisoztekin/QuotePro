 //
//  NetworkManager.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-03-15.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    
    class func getRandomPhoto(completionHandler:@escaping(Photo) -> Void) {
        let url = URL(string: "http://lorempixel.com/600/300/nature/")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("couldn't image from data")
                return
            }
            completionHandler(Photo(image: image))
        }
        
        task.resume()

    }
    
    class func getRandomQuote(completionHandler:@escaping(Quote) -> Void) {
     
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")

        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            

            guard let json = try? JSONSerialization.jsonObject(with: data, options:[]) as! Dictionary<String ,String> else{return}
            
             let quote = Quote(text: json["quoteText"]! as String, author: json["quoteAuthor"]! as String)
            completionHandler(quote)
            
        }
        
        
        task.resume()

    }
    
}
