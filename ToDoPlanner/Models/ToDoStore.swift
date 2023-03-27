//
//  ToDoStore.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-03-26.
//

import Foundation
import SwiftUI


class ToDoStore: ObservableObject {
    @Published var todos: [ToDo] = []
}
