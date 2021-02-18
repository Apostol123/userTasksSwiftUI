//
//  ContentView.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 10/02/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State var username = ""
    @State var password = ""
    private let  navigateToTaskView = FlowState()
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
               
                VStack {
                    Flow(state: self.navigateToTaskView) {
                        TaskView().environmentObject(TasksSetting(user: self.viewModel.currentUser))
                    }
                Text("Login")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom,100)
                TextField("Username", text: $username)
                    .frame(width: geometry.size.width/2, height: 80)
                    
                SecureField("Password", text: $password)
                    .frame(width: geometry.size.width/2, height: 80)
                Button("Login", action: {
                    if viewModel.login(username: username, password: password) {
                        self.navigateToTaskView.next = true
                       
                    }
                })
                .frame(width: geometry.size.width/2, height: 80)
                .background(Color.orange)
                .cornerRadius(20)
                }
            }
        }
        .onAppear(perform: {
            self.viewModel.getUsers()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
