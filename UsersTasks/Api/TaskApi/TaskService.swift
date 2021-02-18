//
//  TaskService.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 11/02/2021.
//

import Foundation
import Combine

protocol TaskService {
    var apiSession: ApiService {get}
    func getTasks() -> AnyPublisher<[Todo],APIError>
}

extension TaskService {
    func getTasks() -> AnyPublisher<[Todo],APIError> {
        return apiSession.request(with: TaskEndPoint.taskList).eraseToAnyPublisher()
    }
}
