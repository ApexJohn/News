//
//  NewsItemCell.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/27/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class NewsItemCell: UICollectionViewCell {
    
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with newsItem: NewsItem) {
        self.itemTypeLabel.text = newsItem.label + " - " + newsItem.type
        self.dateLabel.text = newsItem.publishedOn
        self.headerLabel.text = newsItem.headline
        self.summaryLabel.text = newsItem.summary
        self.loadImage(from: newsItem)
    }
    
    private func loadImage(from newsItem: NewsItem) {
        
        if let cachedImage = NewsImageCache.shared.image(withId: newsItem.imageUrl) {
            
            self.imageActivityIndicator.stopAnimating()
            self.imageView.image = cachedImage
            
        } else if let imageUrl = URL(string: newsItem.imageUrl) {
            
            self.imageView.image = nil
            self.imageActivityIndicator.startAnimating()
            
            self.imageView.af_setImage(withURL: imageUrl, completion: { [weak self] response in
                
                if let image = response.value,
                    let urlString = response.request?.url?.absoluteString {
                    
                    NewsImageCache.shared.cache(image: image, withId: urlString)
                    self?.imageActivityIndicator.stopAnimating()
                }
            })
        }
    }
}
