//
//  ToDoDisplay.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-26.
//

import SwiftUI

struct ToDoDisplay: View {
    @ObservedObject var todo: ToDo
    
    // Environment variable to dismiss the page on button click
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        ZStack{
            Color(todo.theme).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Label(todo.category, systemImage: todo.icon)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .font(.system(size: 24))
                }.padding(.bottom)
                VStack(alignment: .leading, spacing: 5){
                    Text(todo.title)
                        .font(.system(size: 48))
                        .fontWidth(.compressed)
                        .fontWeight(.black)
                        .padding(.bottom)
                    Text("Description")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                        .padding(.leading)

                    Text(todo.description)
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .frame(width: 350,alignment: .leading)
                        .padding(.leading)
                        
                }
                VStack(alignment: .leading, spacing: 5){
                    Label("Time", systemImage: "clock.fill")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .fontWidth(.compressed)
                    HStack{
                        Text(todo.dateStart, style: .time)
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                            .padding(.leading, 25)
                        Text("-")
                        Text(todo.dateEnd, style: .time)
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                    }
                    
                }
                VStack(alignment: .leading){
                    Text("Tasks")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .fontWidth(.compressed)
                        .padding(.bottom, -5)
                    
                    ScrollView{
                        if(todo.tasks.count == 0){
                            Text("Nothing to do...")
                                .padding(.horizontal)
                                .font(.system(size: 32))
                                .foregroundColor(Color.white)
                                .fontWeight(.black)
                                .fontWidth(.compressed)
                                .padding(.top, 100)
                        
                        }
                        else{
                            VStack(alignment: .leading){
                                ForEach(todo.tasks, id: \.description){item in
                                    HStack{
                                        Text(item)
                                            .fontWeight(.heavy)
                                            .font(.system(size: 24))
                                    }
                                }

                            }
                            .padding(.trailing)
                            
                        }
                        
                    }
                    .frame(maxHeight: 250)
                    
                }
                HStack{
                    Toggle("", isOn: $todo.isCompleted)
                        .frame(maxWidth: 50)
                    Spacer()
                    Text("Complete")
                        .fontWeight(.black)
                        .fontWidth(.compressed)
                        .font(.system(size: 60))
                }
                .frame(maxWidth: 400, alignment: .center)
                .padding(.horizontal, 50)
            }
            .padding()
        }
        /* Adding a custom back button for navigation utilizing
        the .toolbar property, hide the original
         
         Source: https://sarunw.com/posts/custom-back-button-action-in-swiftui/ */
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    dismiss() // Dismiss call
                } label: {
                    // New back button!
                    HStack{
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(Color.black)
                            .fontWeight(.black)
                            .font(.system(size: 32))
                    }
                }
            }
        }
    }
}

struct ToDoDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDisplay(todo: ToDo(category: "", title: "", description: "" , dateStart: Date(), dateEnd: Date(), task: [""], status: "", icon: "", theme: ""))
    }
}
