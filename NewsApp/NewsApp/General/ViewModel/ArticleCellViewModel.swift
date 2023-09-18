//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Марина Журавлева on 18.09.2023.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description
        date = article.publishedAt
    }
}
