//
//  NewsItem.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/27/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import Foundation

struct NewsItem: Codable {
    var id: String
    var type: String
    var url: String
    var headline: String
    var published: String
    var tease: String
    var summary: String
    var label: String
    var breaking: Bool?
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case type
//        case url
//        case headline
//        case published
//        case tease
//        case summary
//        case label
//        case breaking
//    }
    
//    init(from decoder: Decoder) throws {
//        let containers = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try containers.decode(String.self, forKey: .id)
//        self.headline = try containers.decode(String.self, forKey: .headline)
//        self.type = try containers.decode(String.self, forKey: .type)
//        self.url = try containers.decode(String.self, forKey: .url)
//        self.published = try containers.decode(String.self, forKey: .published)
//        self.tease = try containers.decode(String.self, forKey: .published)
//        self.summary = try containers.decode(String.self, forKey: .summary)
//        self.label = try containers.decode(String.self, forKey: .label)
//        self.breaking = try containers.decode(Bool.self, forKey: .breaking)
//    }
}
