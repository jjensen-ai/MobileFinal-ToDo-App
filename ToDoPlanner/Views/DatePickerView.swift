//
//  DatePickerView.swift
//  ToDoPlanner
//
//  Created by Jordon Jensen on 2023-02-26.
//

/* Date picker view to be used a modal pop up for picking on the main page*/

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Text(date, style: .date)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                DatePicker("Pick", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .colorScheme(.dark)
                    .tint(Color("PurpleAccent"))
            }
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date()))
    }
}
