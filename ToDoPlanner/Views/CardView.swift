//
//  CardView.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-25.
//

import SwiftUI

/* A card view for the todo items on the main page
 Layout is kinda bland here but its just to see where everything was ending up as it was being layed out*/

struct CardView: View {
    let todo: ToDo
    var body: some View {
        VStack(alignment: .leading)
        {
            HStack{
                Label("\(todo.category)", systemImage: "briefcase.fill")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .font(.system(size: 18))
                    .accessibilityLabel("The category of this to do item is \(todo.category)")
                    
                Spacer()
                Button(){}label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                }
            }
            .padding(.bottom, 15)
            
            Text(todo.title)
                .font(.system(size: 36))
                .fontWeight(.black)
                .fontWidth(.compressed)
                .accessibilityAddTraits(.isHeader)
            
            HStack{
                Text("5 Hours")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                    .background(Color("BGBlack-100"))
                    .cornerRadius(35)
                    .foregroundColor(Color.white)
                    .accessibilityLabel("5 hours remain to finish this task")
                
                Spacer()
                
                Text(todo.status ?? "active")
                    .fontWeight(.bold)
                    .accessibilityLabel("This activity is active")
                    
            }
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var todo = ToDo.sampleData[0]
//    static var previews: some View {
//        CardView(todo: todo)
//    }
//}
