//
//  Theme.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-25.
//

import SwiftUI

enum Theme: String, CaseIterable, Codable {
    
case YellowAccent;
case RedAccent;
case BlueAccent;
case GreenAccent;
case TealAccent;
case SeaFoamAccent;
case PinkAccent;
case OrangeAccent;
case PurpleAccent;
    
    var accentColor: Color{
        switch self {
        case  .YellowAccent, .RedAccent, .BlueAccent, .GreenAccent, .TealAccent, .SeaFoamAccent, .PinkAccent, .OrangeAccent, .PurpleAccent: return .black
        }
}
    var mainColor: Color {
        Color(rawValue)
    }

}
