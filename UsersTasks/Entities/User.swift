//
//  User.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
}
