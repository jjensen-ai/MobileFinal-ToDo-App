//
//  TODOItem.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-25.
//

import Foundation


struct ToDo: Identifiable, Codable {
    let id: UUID
    var category: String
    var title: String
    var dateStart: Date
    var dateEnd: Date
    var status: String?
    var tasks: [String]
    var icon: String
    var theme: String
    
    
    
    init(id: UUID = UUID(), category: String, title: String, dateStart: Date, dateEnd: Date, task: [String], icon: String, status: String, theme: String) {
        self.id = id
        self.category = category
        self.title = title
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.status = status
        self.tasks = task
        self.icon = icon
        self.theme = theme
    }
    
}

