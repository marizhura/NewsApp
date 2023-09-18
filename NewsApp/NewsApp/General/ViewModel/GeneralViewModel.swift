//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Марина Журавлева on 12.09.2023.
//

import UIKit

protocol GeneralViewModelProtocol {
    var reloadData : (() -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleResponseObject] = [] {
        didSet {
            reloadData?()
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
        setupMockObjects()
    }
    
    private func setupMockObjects() {
        articles = [
        ArticleResponseObject(title: "First object title", description: "First object description in the mock object", urlToImage: "...", publishedAt: "11.11.11"),
        ArticleResponseObject(title: "Second object title", description: "Second object description in the mock object", urlToImage: "...", publishedAt: "11.11.11"),
        ArticleResponseObject(title: "Third object title", description: "Third object description in the mock object", urlToImage: "...", publishedAt: "11.11.11"),
        ArticleResponseObject(title: "Fourth object title", description: "Fourth object description in the mock object", urlToImage: "...", publishedAt: "11.11.11"),
        ArticleResponseObject(title: "Fifth object title", description: "Fifth object description in the mock object", urlToImage: "...", publishedAt: "11.11.11")
        ]
    }
}
