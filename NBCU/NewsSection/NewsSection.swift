//
//  NewsSection.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/27/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import Foundation

struct NewsSection: Codable {
    var id: String
    var type: String
    var header: String
    var showMore: Bool
    var items: [NewsItem]
}
