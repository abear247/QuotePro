//
//  QuoteTableViewCell.swift
//  QuotePro
//
//  Created by Alex Bearinger on 2017-02-15.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
