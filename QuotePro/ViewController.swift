//
//  ViewController.swift
//  QuotePro
//
//  Created by Alex Bearinger on 2017-02-15.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var storyboardQuoteView: QuoteView!
 
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Swift
        if let objects = Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil),
            let view = objects.first {
            // set up view in view hierarchy
            let quoteView = view as! QuoteView
            quoteView.frame = storyboardQuoteView.bounds
            storyboardQuoteView.addSubview(quoteView)
        }
    }

    //MARK: Actions
    @IBAction func generateQuoteButton(_ sender: Any) {
    }
    @IBAction func generateImageButton(_ sender: Any) {
    }
    

}

