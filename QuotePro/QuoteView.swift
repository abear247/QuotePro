//
//  QuoteView.swift
//  QuotePro
//
//  Created by Alex Bearinger on 2017-02-15.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    
    //MARK: Properties
    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(quote: QuoteObject){
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
    }
    
    //MARK: Properties
    @IBOutlet weak var generateQuoteButton: UIButton!
    @IBOutlet weak var generateImageButton: UIButton!
}
