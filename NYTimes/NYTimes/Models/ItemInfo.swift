//
//  ItemInfo.swift
//  NYTimes
//
//  Created by Chandan Singh on 26/01/20.
//  Copyright © 2019 @Personal. All rights reserved.
//

import Foundation

    
struct ItemInfo: Codable {
    
    // MARK: Properties
    
    var id: Int
    var title: String
    var byLine: String
    var publishedDate: String
    var abstract: String
    var source: String
    var urlString: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case byLine = "byline"
        case publishedDate = "published_date"
        case abstract
        case source
        case urlString = "url"
    }
}

struct ItemInfoList: Codable {
    var results: [ItemInfo]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
