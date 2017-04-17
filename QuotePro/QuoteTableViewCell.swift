//
//  QuoteTableViewCell.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-04-17.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var quotePreview: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
