//
//  TODOItem.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-25.
//

import Foundation


class ToDo: Identifiable, ObservableObject, Codable{
    let id: UUID
    var category: String
    var title: String
    var description: String
    var dateStart: Date
    var dateEnd: Date
    var status: String
    var tasks: [String]
    var icon: String
    var theme: String
    var isCompleted: Bool
    
  
    
    
    init(id: UUID = UUID(), category: String, title: String, description: String, dateStart: Date, dateEnd: Date, task: [String], status: String, icon: String, theme: String, isCompleted: Bool = false) {
        self.id = id
        self.category = category
        self.title = title
        self.description = description
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.status = status
        self.tasks = task
        self.icon = icon
        self.theme = theme
        self.isCompleted = isCompleted
    }
    
}


