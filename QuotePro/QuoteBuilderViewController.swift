//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-03-15.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

protocol UserQuoteDelegate {
    func addToArray(userQuote:UserQuote)
}

class QuoteBuilderViewController: UIViewController {

    @IBOutlet weak var changeQuoteButton: UIButton!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var builderView: UIView!
    var userQuoteDelegate: UserQuoteDelegate!
    var quoteView: QuoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteView = QuoteView(frame: builderView.bounds)
        quoteView.configureWithRandomQuoteAndImage()
        
        builderView.insertSubview(quoteView, at: 0)


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        }

    }
    
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        
        let userQuote = UserQuote(quote: quoteView.quote, photo: quoteView.photo)
        userQuoteDelegate.addToArray(userQuote: userQuote)
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func changeImage(_ sender: UIButton) {
        quoteView.changePhoto()
        
    }
    @IBAction func changeQuote(_ sender: UIButton) {
        quoteView.changeQuote()
        
    }
    


}
