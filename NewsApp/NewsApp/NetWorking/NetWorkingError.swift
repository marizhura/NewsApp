//
//  NetWorkingError.swift
//  NewsApp
//
//  Created by Марина Журавлева on 20.09.2023.
//

import Foundation

enum NetWorkingError: Error {
case netWorkingError(code: String)
case unknown
}
