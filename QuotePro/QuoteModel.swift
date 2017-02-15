//
//  QuoteModel.swift
//  QuotePro
//
//  Created by Alex Bearinger on 2017-02-15.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class QuoteModel: NSObject {
    //MARK: Properties
    var quotes = [QuoteObject]()
    var photos = [PhotoObject]()
    
    //MARK: Singleton
    static let sharedInstance : QuoteModel = {
        let instance = QuoteModel()
        return instance
    }()

    func generateQuote(completionHandler: @escaping (QuoteObject) -> Void){
        
        let parseURL = URL.init(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let urlRequest = URLRequest.init(url: parseURL!)
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession.init(configuration: configuration)
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard (error == nil) else {
                print("Error\(error?.localizedDescription)")
                return
            }
            
            guard let rawJSON = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : String] else {
                print("jsonError")
                return
            }
            
            guard (rawJSON != nil) else{
                return
            }
            let jsonQoute = rawJSON!["quoteText"]
            let jsonAuthor = rawJSON!["quoteAuthor"]
            
            guard (jsonQoute != nil),(jsonAuthor != nil) else{
                print("incorrect json dictionary access")
                return
            }
            DispatchQueue.main.async {
                completionHandler(QuoteObject(quote: jsonQoute!, author: jsonAuthor!))
            }
        }
        dataTask.resume()
    }
    
    func generateImage(completionHandler: @escaping (PhotoObject) -> Void){
        let parseURL = URL.init(string: "http://lorempixel.com/375/500/")
        let urlRequest = URLRequest.init(url: parseURL!)
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession.init(configuration: configuration)
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard (error == nil) else {
                print("Error\(error?.localizedDescription)")
                return
            }
            
            guard let image = UIImage.init(data:data!) else {
                print("data error")
                return
            }
            
            let photo = PhotoObject.init(image: image)
            
            DispatchQueue.main.async {
            completionHandler(photo)
            }
        }
        dataTask.resume()
    }
}
