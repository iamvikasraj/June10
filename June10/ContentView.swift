//
//  ContentView.swift
//  June10
//
//  Created by Vikas Raj Yadav on 10/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var speed: Double = 50
    @State private var isEditing = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("\(Int(speed))")
                .font(.system(size: 180))
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .contentTransition(.numericText(value: speed))
                .blur(radius: isEditing ? 2 : 0)
                .scaleEffect(isEditing ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.3), value: isEditing)
                .animation(.easeInOut(duration: 0.5), value: speed)
           
            Slider( value: $speed, in: 0...100, step: 1,
                onEditingChanged: { editing in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isEditing = editing
                    }
                }
            )
            .padding(.horizontal)
            .frame(width: 220)
            .opacity(isEditing ? 1 : 0.8)
            .animation(.easeInOut(duration: 0.3), value: isEditing)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 203/255, green: 203/255, blue: 205/255))
    }
       
}

#Preview {
    ContentView()
}
