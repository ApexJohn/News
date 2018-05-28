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
    private let newsDetailsSegueId = "showDetailsWebViewSegue"
    private var newsService = NewsService()
    
    
    // MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.newsService.loadSections { [weak self] (sections, error) in
            if let error = error {
                self?.handleError(error)
            } else {
                self?.newsSections = sections
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? NewsDetailsWebViewController,
            let newsItem = sender as? NewsItem {
            
            detailsVC.newsItem = newsItem
        }
    }
    // MARK: private
    
    private func handleError(_ error: NSError) {
        let alertController = UIAlertController(title: "Sorry", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK:
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

// MARK:
extension NewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.size.width
        // constants defined as properties only when used outside the function
        // to avoid misuse
        let cellDefaultHeight: CGFloat = 418
        
        return CGSize(width: width, height: cellDefaultHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let newsItem = self.newsSections[indexPath.section].items[indexPath.row]
        self.performSegue(withIdentifier: self.newsDetailsSegueId,
                          sender: newsItem)
    }
}
