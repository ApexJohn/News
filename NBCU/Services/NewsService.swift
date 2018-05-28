//
//  NewsService.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/27/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import Foundation
import Alamofire

class NewsService {
    let baseUrl = "http://msgviewer.nbcnewstools.net:9207/v1"
    let endpoint = "/query/curation/news/"
    
    var page: Int = 1
    var pageSize: Int = 30
    
    func loadSections(completion: @escaping (_ sections: [NewsSection], _ error: NSError?) -> Void) {
        
        let fullUrl = self.baseUrl + self.endpoint
        let parameters = ["size": self.page * self.pageSize]
        
        Alamofire.request(fullUrl, parameters: parameters, encoding: URLEncoding.queryString).responseData { response in
            
            if let error = response.error as NSError? {
                completion([], error)
            } else if let jsonData = response.value {
                do {
                let sections = try JSONDecoder().decode([NewsSection].self, from: jsonData)
                    
                    completion(sections, nil)
                } catch let error as NSError {
                    completion([], error)
                }
            }
        }
    }
}
