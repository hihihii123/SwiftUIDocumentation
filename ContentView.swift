//
//  ContentView.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 18/9/23.
//

import SwiftUI
import SwiftPersistence

struct ContentView: View {
    var body: some View{
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        TodoList()
                    } label: {
                        Text("Todolist app")
                    }
                    NavigationLink {
                        Lesson1()
                    } label: {
                        Text("Lesson")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

