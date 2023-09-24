//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Марина Журавлева on 18.09.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
