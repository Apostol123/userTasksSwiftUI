//
//  TasksView.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var taskSettings: TasksSetting
    var body: some View {
        VStack {
            Text("Hola \(taskSettings.user?.name ?? "No User Found")")
        }.onAppear {
            taskSettings.getTasks()
            print("Todos: \(taskSettings.todos)")
        }
    }
}
