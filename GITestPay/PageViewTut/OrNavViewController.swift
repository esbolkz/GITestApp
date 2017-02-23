//
//  OrNavViewController.swift
//  PageViewTut
//
//  Created by kraft on 2/22/17.
//  Copyright © 2017 yesbolapple. All rights reserved.
//

import UIKit

class OrNavViewController: UINavigationController {

    
    var sectionData = [Int]()
    var ind = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let visibleVC = visibleViewController as? PlacesTableViewController{
            visibleVC.ratingFromPageControl = sectionData
            visibleVC.ind = ind
        }
   
    }

    

}
