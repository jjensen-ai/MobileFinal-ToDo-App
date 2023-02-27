//
//  ToDoDisplay.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-26.
//

import SwiftUI

struct ToDoDisplay: View {
    @State private var completed1 = false
    @State private var completed2 = false
    @State private var completed3 = false
    @State private var completed4 = false
    @State private var completed5 = false
    
    // Environment variable to dismiss the page on button click
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        ZStack{
            Color("YellowAccent").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Label("Work", systemImage: "briefcase.fill")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .font(.system(size: 24))
                    Spacer()
                    Button(){}label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.black)
                            .fontWeight(.black)
                            .font(.system(size: 24))
                    }
                }.padding(.bottom)
                VStack(alignment: .leading, spacing: 5){
                    Text("Finish Mobile Mockup")
                        .font(.system(size: 48))
                        .fontWidth(.compressed)
                        .fontWeight(.black)
                        .padding(.bottom)
                    Text("Description")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                        .padding(.leading)

                    Text("Need to complete several screens to set up the GUI for the application, with some light programming added.")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .frame(width: 350)
                        .padding(.leading, 25)
                        
                }
                VStack(alignment: .leading, spacing: 5){
                    Label("Time", systemImage: "clock.fill")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .fontWidth(.compressed)
                    Text("8:30 AM - 4:30 PM")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .padding(.leading, 25)
                }
                VStack(alignment: .leading){
                    Text("Tasks")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .fontWidth(.compressed)
                        .padding(.bottom, -5)
                    ScrollView{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Launch Screen")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 24))
                                Toggle("", isOn: $completed1)
                            }
                            .padding(.leading, 25)
                            HStack{
                                Text("Home Screen")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 24))
                                Toggle("", isOn: $completed2)
                            }
                            .padding(.leading, 25)
                            HStack{
                                Text("Form Screen")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 24))
                                Toggle("", isOn: $completed3)
                            }
                            .padding(.leading, 25)
                            HStack{
                                Text("TODO Screen")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 24))
                                Toggle("", isOn: $completed4)
                            }
                            .padding(.leading, 25)
                        }
                        .padding(.trailing)
                    }
                    .frame(maxHeight: 250)
                    
                }
                HStack{
                    Toggle("", isOn: $completed5)
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
        ToDoDisplay()
    }
}
