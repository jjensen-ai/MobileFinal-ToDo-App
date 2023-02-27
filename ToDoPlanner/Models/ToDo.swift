//
//  TODOItem.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-25.
//

import Foundation


struct ToDo: Identifiable {
    let id: UUID
    var category: String
    var title: String
    var remainingTime: Int
    var status: String
    var theme: Theme
    
    init(id: UUID = UUID(), category: String, title: String, remainingTime: Int, status: String, theme: Theme) {
        self.id = id
        self.category = category
        self.title = title
        self.remainingTime = remainingTime
        self.status = status
        self.theme = theme
    }
    
}

extension ToDo{
    static let sampleData: [ToDo] = [
        ToDo(category: "Work", title: "Finish Mobile Mockup", remainingTime: 7, status: "Active", theme: .YellowAccent),
        ToDo(category: "Home", title: "Paint Cabinets", remainingTime: 3, status: "Complete", theme: .TealAccent),
        ToDo(category: "Food", title: "Get Groceries", remainingTime: 2, status: "Incomplete", theme: .PurpleAccent),
        ToDo(category: "Finance", title: "Pay Bills", remainingTime: 1, status: "Active", theme: .GreenAccent)
    ]
}
