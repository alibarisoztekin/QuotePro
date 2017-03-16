//
//  QuoteView.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-03-15.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

@IBDesignable
class QuoteView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var quoteImageView: UIImageView!
    var quote: Quote!
    var photo: Photo!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: "QuoteView", bundle: bundle).instantiate(withOwner: self, options: nil)
        
        addSubview(view)
        view.frame = bounds
    }

    func configureWithRandomQuoteAndImage()  {
        NetworkManager.getRandomQuote { quote in
            self.quote = quote
            self.quoteLabel.text = quote.text
            self.authorNameLabel.text = quote.author
        }
        NetworkManager.getRandomPhoto { photo in
            self.photo = photo
            self.quoteImageView.image = photo.image

        }

    }
    func configureWith(userQuote: UserQuote){
        quoteLabel.text = userQuote.quote.text
        authorNameLabel.text = userQuote.quote.author
        quoteImageView.image = userQuote.photo.image
        
    }
    func changeQuote () {
        NetworkManager.getRandomQuote { quote in
            self.quote = quote
        }
        quoteLabel.text = quote.text
        authorNameLabel.text = quote.author
    }
    
    func changePhoto() {
        NetworkManager.getRandomPhoto { photo in
            self.photo = photo
        }
        quoteImageView.image = photo.image

    }
    

}
