//
//  ToDoStore.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-03-26.
//

import Foundation
import SwiftUI

@MainActor
class ToDoStore: ObservableObject {
    @Published var todos: [ToDo] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("todos.data")
    }
    
    func load() async throws {
        let task = Task<[ToDo], Error>{
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else{
                return []
            }
            let currentTodos = try JSONDecoder().decode([ToDo].self, from: data)
            return currentTodos
        }
        let todos = try await task.value
        self.todos = todos
    }
    
    func save(todos: [ToDo]) async throws{
        let task = Task {
            let data = try JSONEncoder().encode(todos)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
