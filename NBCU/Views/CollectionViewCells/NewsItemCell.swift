//
//  NewsItemCell.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/27/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import Foundation
import UIKit

class NewsItemCell: UICollectionViewCell {
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with newsItem: NewsItem) {
        self.itemTypeLabel.text = newsItem.label + " - " + newsItem.type
        self.dateLabel.text = newsItem.publishedOn
        self.headerLabel.text = newsItem.headline
        self.summaryLabel.text = newsItem.summary
        
    }
}
