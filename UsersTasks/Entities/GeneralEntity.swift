//
//  GeneralEntity.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import Foundation

struct GeneralEntity: Codable, Identifiable {
    var id = UUID()
    var usersList: [User]
}
