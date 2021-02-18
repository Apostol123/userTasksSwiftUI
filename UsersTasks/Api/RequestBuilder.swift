//
//  RequestBuilder.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest {
        get
    }
}
