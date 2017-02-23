//
//  WebViewController.swift
//  PageViewTut
//
//  Created by kraft on 2/24/17.
//  Copyright © 2017 yesbolapple. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string:"https://globalpay.kz")!
        
        webView.loadRequest(URLRequest(url: url))
        
        
    }
    
    
}
