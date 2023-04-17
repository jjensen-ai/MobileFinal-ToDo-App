//
//  ContentView.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-24.
//

import SwiftUI
import Foundation


struct ContentView: View {
    
    // Using TODO Struc as array type so we can use the example data
    
    // State Variables for date and toggling the calendar
    @State var date = Date()
    @State var toggleCalendar = false
    @State var count = 0
    @State var displayAll = true
    @State var displayCompleted = false
    @State var displayActive = false
    @State var displayInComplete = false
    @Binding public var todoItems: [ToDo]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    // Counting any item status that match the string when called
    func activeCount(Status: String) -> Int{
        let count = todoItems.filter { $0.status == Status }.count
        return count
    }
    
    // Formatting the date to a string, that accepts a String of the format to produce the current date at the top of the page
    func currentDate(Format: String, pickedDate: Date) -> String{
        let date = pickedDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Format
        return dateFormatter.string(from: date)
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("BGBlack-700").ignoresSafeArea()
                VStack(spacing: 0)
                {
                    HStack{
                        Button{()}label: {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                                .tint(Color.white)
                                .font(.system(size: 25))
                                .fontWeight(.black)
                        }
                        Spacer()
                        LazyHStack{
                            Button{
                                toggleCalendar.toggle()
                            }label: {
                                Image(systemName: "calendar")
                                    .imageScale(.large)
                                    .tint(Color("YellowAccent"))
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                            }
                            .sheet(isPresented: $toggleCalendar){
                                DatePickerView(date: $date)
                                    .presentationDetents([.height(450)])
                            }
                            
                        }
                        Image("Pfp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 100)
                            .padding(.trailing, -5)
                    }
                    .frame(height: 100)
                    HStack{
                        LazyVStack{
                            Text(currentDate(Format:"EEEE", pickedDate: date)) // Weekday format
                                .foregroundColor(Color("YellowAccent")
                                )
                                .font(.system(size: 24))
                                .fontWidth(.compressed)
                                .frame(maxWidth: .infinity, maxHeight: 20,alignment: .bottomLeading)
                                .padding(.bottom, -100)
                            HStack{
                                Text(currentDate(Format:"MMMM", pickedDate: date)) // Long Month format
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 40))
                                    .fontWidth(.compressed)
                                    .fontWeight(.black)
                                    .frame(maxHeight: 55,alignment: .bottom)

                                Text(currentDate(Format: "d", pickedDate: date))// Day number of hte month format
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 70))
                                    .fontWidth(.compressed)
                                    .fontWeight(.black)
                                    .padding(.top, -10)
                                
                                Text(currentDate(Format: "y", pickedDate: date)) // Year Format
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 40))
                                    .fontWidth(.compressed)
                                    .fontWeight(.black)
                                    .frame(maxHeight: 55,alignment: .bottom)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -5)

                        }

                    }
                    .padding(.leading, 15)
                    
                    Divider()
                        .frame(height: 3)
                        .overlay(.white)
                        
                    
                    HStack{
                        Text("TODO")
                            .padding(.horizontal)
                            .font(.system(size: 32))
                            .foregroundColor(Color.white)
                            .fontWeight(.black)
                            .fontWidth(.compressed)

                        Spacer()
                        LazyHStack{
                            Button{
                                displayAll = true
                                displayActive = false
                                displayCompleted = false
                                displayInComplete = false
                            }label: {
                                Text("All")
                                    .padding(.horizontal)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2))
                                    .font(.system(size:20))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                            Button{
                                displayAll = false
                                displayActive = false
                                displayCompleted = true
                                displayInComplete = false
                            }label: {
                                Image(systemName: "checkmark")
                                    .padding(.horizontal)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2))
                                    .font(.system(size:20))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                            Button{
                                displayAll = false
                                displayActive = true
                                displayCompleted = false
                                displayInComplete = false
                            }label: {
                                Image(systemName: "clock.arrow.2.circlepath")
                                    .padding(.horizontal)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2))
                                    .font(.system(size:20))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                            Button{
                                displayAll = false
                                displayActive = false
                                displayCompleted = false
                                displayInComplete = true
                            }label: {
                                Text("X")
                                    .padding(.horizontal)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2))
                                    .font(.system(size:20))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                        }
                        .frame(height: 50)
                        
                    }
                    .padding(.top, 10)
                    
                    ScrollView{
                            ForEach(todoItems) { todo in
                                NavigationLink(destination: ToDoDisplay(todo: todo))
                                {
                                    if( Calendar.current.isDate(date, inSameDayAs: todo.dateStart) && displayAll){
                                        CardView(todo: todo, todoItems: $todoItems)
                                            .padding(.all, 12.5)
                                            .background(Color(todo.theme))
                                            .foregroundColor(Color(.black))
                                            .cornerRadius(15)
                                            .padding(.bottom, 20)
                                    }
                                    if( Calendar.current.isDate(date, inSameDayAs: todo.dateStart) && displayCompleted && todo.status == "Complete"){
                                        CardView(todo: todo, todoItems: $todoItems)
                                            .padding(.all, 12.5)
                                            .background(Color(todo.theme))
                                            .foregroundColor(Color(.black))
                                            .cornerRadius(15)
                                            .padding(.bottom, 20)
                                    }
                                    if( Calendar.current.isDate(date, inSameDayAs: todo.dateStart) && displayInComplete && todo.status == "Incomplete"){
                                        CardView(todo: todo, todoItems: $todoItems)
                                            .padding(.all, 12.5)
                                            .background(Color(todo.theme))
                                            .foregroundColor(Color(.black))
                                            .cornerRadius(15)
                                            .padding(.bottom, 20)
                                    }
                                    if( Calendar.current.isDate(date, inSameDayAs: todo.dateStart) && displayActive && todo.status == "Active"){
                                        CardView(todo: todo, todoItems: $todoItems)
                                            .padding(.all, 12.5)
                                            .background(Color(todo.theme))
                                            .foregroundColor(Color(.black))
                                            .cornerRadius(15)
                                            .padding(.bottom, 20)
                                    }
                                }
                            }
                    }
                    .frame(height: 500)
                    .padding(.top, 10)
                    
                    let isActive: Int = activeCount(Status: "Active")
                    let isComplete: Int = activeCount(Status: "Complete")
                    let inComplete: Int = activeCount(Status: "Incomplete")
                    
                    HStack{
                        Text("\(String(isActive)) Active")
                            .foregroundColor(Color.white)
                            .fontWeight(.black)
                            .font(.system(size: 16))
                            .padding(.trailing, 8)
                        Text("\(String(isComplete)) Complete")
                            .foregroundColor(Color("PurpleAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 16))
                            .padding(.trailing, 8)

                        Text("\(String(inComplete)) Incomplete")
                            .foregroundColor(Color("RedAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 16))
                        
                        Spacer()
                        NavigationLink(destination: ToDoForm(todoItems: $todoItems))
                        {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color("YellowAccent"))
                                    .font(.system(size: 50))
                            
                        }
                        .onChange(of: scenePhase){
                            phase in
                            if phase == .inactive{saveAction()}
                        }
                        
                    }
                    .padding(.top, 40)
                }
                .padding()
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todoItems: .constant([ToDo(category: "", title: "", description: "", dateStart: Date(), dateEnd: Date(), task: [""],status: "", icon: "", theme: "", isCompleted: false)]), saveAction: {})
    }
    
}
