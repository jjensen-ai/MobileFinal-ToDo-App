//
//  ToDoPlannerApp.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-24.
//

import SwiftUI

@main
struct ToDoPlannerApp: App {
    @StateObject private var store = ToDoStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(todoItems: $store.todos){
                Task {
                    do{
                        try await store.save(todos: store.todos)
                    }catch{
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do{
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
