//
//  UsersTasksApp.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import SwiftUI

@main
struct UsersTasksApp: App {
    var settings = UserViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}
