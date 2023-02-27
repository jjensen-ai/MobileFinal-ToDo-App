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
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var category: String = ""
    @State private var date = Date()
    
    // Environment variable to dismiss the page on button click
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack
        {
            Color("BGBlack-700").ignoresSafeArea()
            VStack{
                VStack(alignment: .leading){
                    Text("Category")
                        .foregroundColor(Color("YellowAccent"))
                        .fontWeight(.black)
                        .font(.system(size: 32))
                        .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
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
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))

                }
                .padding(.bottom)

                VStack(alignment: .leading){
                    Text("Time and Date")
                        .foregroundColor(Color("YellowAccent"))
                        .fontWeight(.black)
                        .font(.system(size: 32))
                        .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
                    VStack{
                        DatePicker("Start", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                            .colorScheme(.dark)
                            .tint(Color("PurpleAccent"))
                            .fontWeight(.bold)
                            .font(.system(size: 25))

                        DatePicker("End", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
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
                        Button{}label:{
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color.white)
                                .fontWeight(.black)
                                .font(.system(size: 34))
                        }
                    }
                    .padding(.horizontal, 25)
                }
                Spacer()
                Button{}label:{
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
        ToDoForm()
    }
}
