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
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.hidesBarsOnTap = false
        DispatchQueue.main.async {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
        
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userQuoteArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuoteTableViewCell
        let quoteView = QuoteView(frame: cell.quotePreview.frame)
        quoteView.configureWith(userQuote: userQuoteArray[indexPath.row])
        cell.quotePreview.addSubview(quoteView)
        quoteView.frame = cell.quotePreview.bounds
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! QuoteBuilderViewController
        destinationVC.userQuoteDelegate = self
    }

 

    func addToArray(userQuote:UserQuote){
        userQuoteArray.append(userQuote)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shareImagefrom(userQuote: userQuoteArray[indexPath.row])
        
    }
    
    func shareImagefrom(userQuote:UserQuote){
        let quoteView = QuoteView(frame: CGRect(x: 0, y: 0, width: 667 , height: 375))
        quoteView.configureWith(userQuote: userQuote)
        UIGraphicsBeginImageContext(quoteView.bounds.size)
        quoteView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imageToShare = UIGraphicsGetImageFromCurrentImageContext()
        
        let activityVC = UIActivityViewController.init(activityItems: [imageToShare!], applicationActivities: nil)
        navigationController?.present(activityVC, animated: true, completion: nil)
    }
    


}
