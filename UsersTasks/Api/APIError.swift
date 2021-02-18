//
//  APIError.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
