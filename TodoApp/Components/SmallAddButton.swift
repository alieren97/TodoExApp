//
//  SmallAddButton.swift
//  TodoApp
//
//  Created by Ali Eren on 16.01.2022.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width:40)
                .foregroundColor(Color(hue:0.328,saturation: 0.796,brightness: 0.408))
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height:50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
