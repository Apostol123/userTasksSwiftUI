//
//  TaskViewModel.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 11/02/2021.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    var userId: Int?
    
    init(userId: Int?) {
        self.userId = userId
    }
}
