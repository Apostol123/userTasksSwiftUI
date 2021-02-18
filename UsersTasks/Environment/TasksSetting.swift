//
//  Environment.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 11/02/2021.
//

import SwiftUI
import Combine

class TasksSetting: ObservableObject, TaskService {
    var apiSession: ApiService
    @Published var user: User?
    var cancellables = Set<AnyCancellable>()
    @Published var todos = [Todo]()
    
    init(user: User?, apiSession: APISession = APISession()) {
        self.user = user
        self.apiSession = apiSession
    }
    
    func getTasks() {
        let cancellable = self.getTasks()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Hanlde todo error \(error)")
                case .finished:
                    break
                }
            }) { result in
                self.todos = result
            }
        cancellables.insert(cancellable)
    }
}
