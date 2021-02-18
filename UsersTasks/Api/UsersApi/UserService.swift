//
//  UserService.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation
import Combine

protocol UserService {
    var apiSession: ApiService {get}
    func getUsers() -> AnyPublisher<[User],APIError>
}

extension UserService {
    func getUsers() -> AnyPublisher<[User],APIError> {
        return apiSession.request(with: UsersEndPoint.usersList).eraseToAnyPublisher()
    }
}
