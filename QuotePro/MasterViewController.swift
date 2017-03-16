//
//  MasterViewController.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-03-15.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UserQuoteDelegate {
    
    var userQuoteArray:Array<UserQuote>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userQuoteArray = Array<UserQuote>()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userQuoteArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let quoteView = QuoteView(frame: cell.contentView.bounds)
        quoteView.configureWith(userQuote: userQuoteArray[indexPath.row])
        cell.contentView.addSubview(quoteView)

        return cell
    }
    
    


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uiactivityviewcontroller
    }
 


    func addToArray(userQuote:UserQuote){
        userQuoteArray.append(userQuote)
    }

    

}
