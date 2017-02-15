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
    let manager = QuoteModel.sharedInstance
    
    //MARK: Properties
    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(quote: QuoteObject){
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
    }
    
    //MARK: Actions
    @IBAction func generateQuoteButton(_ sender: UIButton) {
        manager.generateQuote{
            (quoteObject: QuoteObject) in
            self.quoteLabel.text = quoteObject.quote
            self.authorLabel.text = quoteObject.author
        }
    }

    @IBAction func generateNewImage(_ sender: UIButton) {
        manager.generateImage {
            (photo) in
            self.quoteImageView.image = photo.image
        }
    }
    @IBAction func saveButton(_ sender: UIButton) {
        guard let photo = quoteImageView.image else{
            return
        }
        guard let quoteText = quoteLabel.text,let authorText = authorLabel.text else{
            return
        }
        let quote = QuoteObject.init(quote: quoteText,author: authorText)
        manager.photos.append(PhotoObject.init(image: photo))
        manager.quotes.append(quote)
    }

}
