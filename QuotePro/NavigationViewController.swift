//
//  NavigationViewController.swift
//  QuotePro
//
//  Created by Ali Barış Öztekin on 2017-03-16.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController is QuoteBuilderViewController ? .landscapeRight : .all
    }

    override var shouldAutorotate: Bool {
        return true
    }


}
