//
//  ToDoForm.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-26.
//

import SwiftUI

struct ToDoForm: View {
    
    /* State Variables to fill out, will be used to save when the
     Data base is hooked up
     */
    @State public var title: String = ""
    @State public var description: String = ""
    @State public var category: String = ""
    @State public var dateStart = Date()
    @State public var dateEnd = Date()
    @State public var tasks = [String]()
    
    
    @State public var colorChoice = "Yellow"
    @State public var iconChoice = "square.dotted"
    
    // Environment variable to dismiss the page on button click
    @Environment(\.dismiss) private var dismiss

    @Binding var todoItems: [ToDo]
    
    
    var body: some View {
        ZStack
        {
            Color("BGBlack-700").ignoresSafeArea()
            VStack{
                ScrollView{
                    HStack{
                        Menu{
                            Button{ colorChoice = "Blue"}label:{
                                Label("Blue", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Purple"}label:{
                                Label("Purple", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Green"}label:{
                                Label("Green", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Red"}label:{
                                Label("Red", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Pink"}label:{
                                Label("Pink", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Yellow"}label:{
                                Label("Yellow", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Orange"}label:{
                                Label("Orange", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "Teal"}label:{
                                Label("Teal", systemImage: "paintpalette.fill")
                            }
                            Button{ colorChoice = "SeaFoam"}label:{
                                Label("SeaFoam", systemImage: "paintpalette.fill")
                            }
                        } label: {
                            Label( title: {Text("Select Color")}, icon: {Image(systemName: "paintpalette.fill")})
                               
                                .foregroundColor(Color("\(colorChoice)Accent"))
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                
    
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Category")
                                .foregroundColor(Color("YellowAccent"))
                                .fontWeight(.black)
                                .font(.system(size: 32))
                                .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                            
                            Menu{
                                Button{ iconChoice = "briefcase.fill"}label:{
                                    Label("Work", systemImage: "briefcase.fill")
                                }
                                Button{ iconChoice = "dumbbell.fill"}label:{
                                    Label("Gym", systemImage: "dumbbell.fill")
                                }
                                Button{ iconChoice = "cart.fill"}label:{
                                    Label("Shopping", systemImage: "cart.fill")
                                }
                                Button{ iconChoice = "takeoutbag.and.cup.and.straw.fill"}label:{
                                    Label("Food", systemImage: "takeoutbag.and.cup.and.straw.fill")
                                }
                                Button{ iconChoice = "wineglass.fill"}label:{
                                    Label("Entertaining", systemImage: "wineglass.fill")
                                }
                                Button{ iconChoice = "airplane"}label:{
                                    Label("Travel", systemImage: "airplane")
                                }
                                Button{ iconChoice = "graduationcap.fill"}label:{
                                    Label("Education", systemImage: "graduationcap.fill")
                                }
                                Button{ iconChoice = "gamecontroller.fill"}label:{
                                    Label("Hobby", systemImage: "gamecontroller.fill")
                                }

                            } label: {
                                Label( title: {Text("Select Icon")}, icon: {Image(systemName: "\(iconChoice)")})
                                    .foregroundColor(Color("YellowAccent"))
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        TextField("Enter Category", text: $category)
                            .preferredColorScheme(.dark)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                            .foregroundColor(Color.white)
                            .tint(Color.white)
                            .frame(width: 350)
                        Divider()
                            .frame(width:350, height: 1)
                            .background(Color.white)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading){
                        Text("Title")
                            .foregroundColor(Color("YellowAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                        TextField("Enter Title", text: $title)
                            .preferredColorScheme(.dark)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                            .foregroundColor(Color.white)
                            .tint(Color.white)
                            .frame(width: 350)

                        Divider()
                            .frame(width:350, height: 1)
                            .background(Color.white)
                    }
                    .padding(.bottom)

                    VStack(alignment: .leading){
                        Text("Description")
                            .foregroundColor(Color("YellowAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 32))
                            .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                        TextField("Enter Description", text: $description, axis: .vertical)
                            .padding()
                            .preferredColorScheme(.dark)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                            .foregroundColor(Color.white)
                            .tint(Color.white)
                            .frame(width: 350, height: 150, alignment: .top)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1.5))

                    }
                    .padding(.bottom)

                    VStack(alignment: .leading){
                        Text("Time and Date")
                            .foregroundColor(Color("YellowAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 32))
                            .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                        VStack{
                            DatePicker("Start", selection: $dateStart, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                                .colorScheme(.dark)
                                .tint(Color("PurpleAccent"))
                                .fontWeight(.bold)
                                .font(.system(size: 25))

                            DatePicker("End", selection: $dateEnd, in: dateStart..., displayedComponents: [.date, .hourAndMinute])
                                .colorScheme(.dark)
                                .tint(Color("PurpleAccent"))
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                        }
                        .padding()
                    }
                    VStack{
                        Text("Tasks")
                            .foregroundColor(Color("YellowAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 38))
                            .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                        HStack{
                            Text("Add Task")
                                .foregroundColor(Color("YellowAccent"))
                                .fontWeight(.black)
                                .font(.system(size: 24))
                                .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                            Button{tasks.append("")}label:{
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.black)
                                    .font(.system(size: 34))
                            }
                        }
                        .padding(.horizontal, 25)
                        ScrollView{
                            if(tasks.count == 0){Text("")}
                            else{
                                ForEach(tasks.indices, id: \.self) {task in
                                    HStack{
                                        TextField("Task", text: $tasks[task])
                                            .preferredColorScheme(.dark)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 24))
                                            .foregroundColor(Color.white)
                                            .tint(Color.white)
                                            .frame(width: 300)
                                        
                                        Button{tasks.remove(at: task)}label: {
                                            Image(systemName: "minus.circle.fill")
                                                .foregroundColor(Color.red)
                                                .fontWeight(.black)
                                                .font(.system(size: 24))
                                        }
                                    }
                                    .padding(.top, 2)
                                }
                            }
                        }
                        .frame(height: 200)
                    }
                }
                Spacer()
                Button{todoItems.append(ToDo(category: category, title: title, description: description, dateStart: dateStart, dateEnd: dateEnd, task: tasks, status: "", icon: iconChoice, theme: "\(colorChoice)Accent", isCompleted: false)); dismiss()}label:{
                    Label("Add TODO", systemImage: "checkmark.circle.fill")
                        .padding()
                        .background(Color("GreenAccent"))
                        .fontWeight(.heavy)
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                        .cornerRadius(25)
                }
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
                            .foregroundColor(Color("YellowAccent"))
                            .fontWeight(.black)
                            .font(.system(size: 32))
                    }
                }
            }
        }
       
    }
}

struct ToDoForm_Previews: PreviewProvider {
    static var previews: some View {
        ToDoForm( todoItems: .constant([ToDo(category: "", title: "",description: "", dateStart: Date(), dateEnd: Date(), task: [""], status: "", icon: "",  theme: "", isCompleted: false)]))
    }
}
