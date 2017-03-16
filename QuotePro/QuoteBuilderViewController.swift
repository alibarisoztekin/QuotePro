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

    @IBOutlet weak var viewForQuoteView: UIView!
    var userQuoteDelegate: UserQuoteDelegate!
    var quoteView: QuoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteView = QuoteView(frame: viewForQuoteView.bounds)
        quoteView.configureWithRandomQuoteAndImage()
        viewForQuoteView.addSubview(quoteView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.landscapeRight
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveTapped(_ sender: UIButton) {
        
        let userQuote = UserQuote(quote: quoteView.quote, photo: quoteView.photo)
        userQuoteDelegate.addToArray(userQuote: userQuote)
        
    }
    @IBAction func changeImage(_ sender: UIButton) {
        quoteView.changePhoto()
        
    }
    @IBAction func changeQuote(_ sender: UIButton) {
        quoteView.changeQuote()
        
    }

}
