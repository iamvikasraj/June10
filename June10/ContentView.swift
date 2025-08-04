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
                .font(.system(size: 100).smallCaps())
                .fontDesign(.monospaced)
                .fontWeight(.light)
                .contentTransition(.numericText())
                .blur(radius: isEditing ? 1 : 0)
                .scaleEffect(isEditing ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.3), value: isEditing)
                .animation(.easeInOut(duration: 0.5), value: speed)
           
            Slider( value: $speed, in: 0...99, step: 1,
                onEditingChanged: { editing in
                    withAnimation(.easeInOut(duration: 0.025)) {
                        isEditing = editing
                    }
                }
            )
            .padding(.horizontal)
            .focusable(false)
            .frame(width: 120)
            .opacity(isEditing ? 1 : 0.9)
            .animation(.spring(duration: 0.3), value: isEditing)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 203/255, green: 203/255, blue: 205/255))
    }
}

#Preview {
    ContentView()
}
