//
//  ApiSession.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation
import SwiftUI
import Combine

struct APISession: ApiService {
    func request<T>(with Builder: RequestBuilder) -> AnyPublisher<T, APIError> where T : Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        //2
        return URLSession.shared
            .dataTaskPublisher(for: Builder.urlRequest)
            //3
            .receive(on: DispatchQueue.main)
            //4
            .mapError {_ in .unknown}
            //5
            .flatMap { data,response -> AnyPublisher<T,APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        //6
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown).eraseToAnyPublisher()
                
            }
            .eraseToAnyPublisher()
    }
    
    
}
