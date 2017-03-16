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


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
        
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userQuoteArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let quoteView = QuoteView(frame: cell.contentView.bounds)
        quoteView.configureWith(userQuote: userQuoteArray[indexPath.row])
        cell.contentView.addSubview(quoteView)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! QuoteBuilderViewController
        destinationVC.userQuoteDelegate = self
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uiactivityviewcontroller
    }
 


    func addToArray(userQuote:UserQuote){
        userQuoteArray.append(userQuote)
    }



}
