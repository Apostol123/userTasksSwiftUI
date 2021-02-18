//
//  File.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation
import Combine

protocol ApiService {
    func request <T:Decodable>(with Builder: RequestBuilder) -> AnyPublisher<T,APIError>
}
