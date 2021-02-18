//
//  TaskEndpoint.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 11/02/2021.
//

import Foundation

enum TaskEndPoint{
    case taskList
}

extension TaskEndPoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .taskList:
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {preconditionFailure("Invalid URL Format for tasks")}
            return URLRequest(url: url)
        }
    }
    
    
}
