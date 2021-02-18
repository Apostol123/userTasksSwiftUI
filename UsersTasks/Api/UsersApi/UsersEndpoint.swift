//
//  UsersEndpoint.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation

enum UsersEndPoint {
    case usersList
}

extension UsersEndPoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .usersList:
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")
            else {preconditionFailure("Invalid URL Format")}
            return URLRequest(url: url)
        }
    }
    
    
}
