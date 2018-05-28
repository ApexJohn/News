//
//  ViewController.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/24/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import UIKit
import Alamofire

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    private var newsSections = [NewsSection]() {
        didSet {
            self.newsCollectionView.reloadData()
        }
    }
    
    private let newsCellId = "newsCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension NewsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.newsSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsSections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.newsCellId, for: indexPath)
        
        let newsItem = self.newsSections[indexPath.section].items[indexPath.row]
        (cell as? NewsItemCell)?.configure(with: newsItem)
        
        return cell
    }
}
