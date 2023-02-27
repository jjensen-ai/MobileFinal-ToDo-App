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
    let todoItems: [ToDo]
    
    // State Variables for date and toggling the calendar
    @State private var date = Date()
    @State var toggleCalendar = false
    
    // Counting any item status that match the string when called
    func activeCount(Status: String) -> Int{
        let count = todoItems.filter { $0.status == Status }.count
        
        return count
    }
    
    // Formatting the date to a string, that accepts a String of the format to produce the current date at the top of the page
    func currentDate(Format: String) -> String{
        let date = Date()
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
                            Button{()}label: {
                                Image(systemName: "repeat")
                                    .imageScale(.large)
                                    .tint(Color("YellowAccent"))
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                            }
                            .padding(.trailing, 10)
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
                                DatePickerView()
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
                            Text(currentDate(Format:"EEEE")) // Weekday format
                                .foregroundColor(Color("YellowAccent")
                                )
                                .font(.system(size: 24))
                                .fontWidth(.compressed)
                                .frame(maxWidth: .infinity, maxHeight: 20,alignment: .bottomLeading)
                                .padding(.bottom, -100)
                            HStack{
                                Text(currentDate(Format:"MMMM")) // Long Month format
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 40))
                                    .fontWidth(.compressed)
                                    .fontWeight(.black)
                                    .frame(maxHeight: 55,alignment: .bottom)

                                Text(currentDate(Format: "d"))// Day number of hte month format
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 70))
                                    .fontWidth(.compressed)
                                    .fontWeight(.black)
                                    .padding(.top, -10)
                                
                                Text(currentDate(Format: "y")) // Year Format
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
                            Button(){
                    
                            }label: {
                                Text("All")
                                    .padding(.horizontal)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2))
                                    .font(.system(size:20))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                            Button(){
                            }label: {
                                Image(systemName: "checkmark")
                                    .padding(.horizontal)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2))
                                    .font(.system(size:20))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                            Button(){
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
                            NavigationLink(destination: ToDoDisplay())
                            {
                                CardView(todo: todo)
                                    .padding(.all, 12.5)
                                    .background(todo.theme.mainColor)
                                    .foregroundColor(todo.theme.accentColor)
                                    .cornerRadius(15)
                                    .padding(.bottom, 20)
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
                            .font(.system(size: 18))
                            .padding(.trailing, 8)
                        Text("\(String(isComplete)) Complete")
                            .foregroundColor(Color("PurpleAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 18))
                            .padding(.trailing, 8)

                        Text("\(String(inComplete)) Incomplete")
                            .foregroundColor(Color("RedAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 18))
                        
                        Spacer()
                        NavigationLink(destination: ToDoForm())
                        {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color("YellowAccent"))
                                    .font(.system(size: 50))
                            
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
        ContentView(todoItems: ToDo.sampleData)
    }
}
