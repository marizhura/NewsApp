//
//  ApiManager.swift
//  NewsApp
//
//  Created by Марина Журавлева on 20.09.2023.
//

import Foundation

final class ApiManager {
    private static let apiKey = "c01e04c915384c5f9adb0acdc3e81dad"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "everything"
    
    // Create url path and make request
    static func getNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
    }
    
    // Handle response
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        if let error = error {
            let errorMessage = error.localizedDescription
            completion(.failure(NetWorkingError.netWorkingError(code: errorMessage)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self, from: data)
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetWorkingError.unknown))
        }
    }
}
