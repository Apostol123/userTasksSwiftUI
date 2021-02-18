//
//  FlowState.swift
//  UsersTasks
//
//  Created by Apostol, Alexandru on 11/02/2021.
//

import SwiftUI

class FlowState: ObservableObject {
    @Published var next = false
}

struct Flow<Content>: View where Content: View {
    @ObservedObject var state: FlowState
    var content: Content
    var body: some View {
        NavigationLink(
            destination: VStack() {content},
            isActive: $state.next
        ) {
            EmptyView()
        }
    }
    init(state: FlowState, @ViewBuilder content:() -> Content) {
        self.state = state
        self.content = content()
    }
}
