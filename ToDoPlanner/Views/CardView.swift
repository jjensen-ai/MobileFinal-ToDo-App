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
    @ObservedObject var todo: ToDo
    @Binding var todoItems: [ToDo]
    
    func calculateTime(startDate: Date, endDate: Date) -> String{
        let differenceHour = Calendar.current.dateComponents([.hour], from: startDate, to: endDate)
        let differenceMinute = Calendar.current.dateComponents([.minute], from: startDate, to: endDate)
        
        let remainingTimeHour = differenceHour.hour!
        let remainingTimeMinute = differenceMinute.minute!
        
        var timeString = ""
        
        if(remainingTimeMinute > 59){
           timeString = "\(String(remainingTimeHour)) Hours"
        }
        if(remainingTimeHour < 1){
            timeString = "\(String(remainingTimeMinute)) Minutes"
        }
        if(remainingTimeMinute <= 0){
           timeString = "--"
        }
        
        return timeString
    }
    
   func todoStatus(toDoStatus: String) -> String{
       var status = toDoStatus
          if(todo.isCompleted){
               status = "Complete"
           }
           else if(Date() >= todo.dateEnd){
               status = "Incomplete"
           }
           else{
               status = "Active"
           }
       todo.status = status
       return status
       }
    
    
    var body: some View {
        VStack(alignment: .leading)
        {
            HStack{
                Label("\(todo.category)", systemImage: todo.icon)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .font(.system(size: 18))
                    .accessibilityLabel("The category of this to do item is \(todo.category)")
                    
                Spacer()
                Button{todoItems.removeToDo(object: todo)}label: {
                    Image(systemName: "x.circle.fill")
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
                Text(calculateTime(startDate:Date(), endDate:todo.dateEnd))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                    .background(Color("BGBlack-100"))
                    .cornerRadius(35)
                    .foregroundColor(Color.white)
                    .accessibilityLabel("5 hours remain to finish this task")
                
                Spacer()
                
                Text(todoStatus(toDoStatus: todo.status))
                    .fontWeight(.bold)
                    .accessibilityLabel("This activity is active")
                    
            }
        }
    }
}

extension Array where Element: AnyObject {
    mutating func removeToDo(object: AnyObject){
        guard let index = firstIndex(where: {$0 === object}) else {return}
        remove(at: index)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(todo: ToDo(category: "String", title: "Title", dateStart: Date(), dateEnd: Date().addingTimeInterval(10), task: [""], status: "active", icon: "", theme: ""))
//    }
//}
