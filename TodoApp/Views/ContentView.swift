//
//  ContentView.swift
//  TodoApp
//
//  Created by Ali Eren on 16.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            TaskView()
                .environmentObject(realmManager)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
                .sheet(isPresented: $showAddTaskView) {
                    AddTaskView()
                        .environmentObject(realmManager)
                }
        }
        .frame(maxWidth:.infinity,maxHeight:.infinity,alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
