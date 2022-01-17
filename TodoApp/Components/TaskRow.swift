//
//  TaskRow.swift
//  TodoApp
//
//  Created by Ali Eren on 16.01.2022.
//

import SwiftUI

struct TaskRow: View {
    var task :String
    var completed : Bool
    var body: some View {
        HStack(spacing:20){
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task:"Do Landrry",completed: true)
    }
}
