//
//  ToDoPlannerApp.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-24.
//

import SwiftUI

@main
struct ToDoPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(todoItems: ToDo.sampleData)
        }
    }
}
