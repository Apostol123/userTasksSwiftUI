//
//  UserViewModel.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation
import Combine
import SwiftUI

class UserViewModel: ObservableObject, UserService {
    
    var apiSession: ApiService
    @Published var users = [User]()
    var cancellables = Set<AnyCancellable>()
    @Published var currentUser: User?
    
    init(apiSession: APISession = APISession()) {
        self.apiSession = apiSession
    }
    
    func getUsers()  {
        let cancellable = self.getUsers()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle Error: \(error)")
                case .finished:
                    break
                }
            }) { results in
                self.users = results
                
            }
        cancellables.insert(cancellable)
    }
    
    func login(username:String , password: String) -> Bool {
        let user = users.first(where: {$0.name == username && $0.username == password})
        self.currentUser = user
        return user != nil ? true : false
    }
}
