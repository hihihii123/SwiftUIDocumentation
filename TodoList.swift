//
//  TodoList.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 19/9/23.
//

import SwiftUI
import SwiftPersistence

struct TodoList: View {
    @Persistent("now", store: .appStorage) var now = ["1"]
    @Persistent("time", store: .appStorage) var times = 0
    @State var list = ""
    struct toDo {
        var name: String
        var Due: Date
        var done: Bool
        var archive: Bool
        var ExtraVar: String?
        var ExtraVarDone: Bool?
    }
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Placeholder code")
                TextField("Input here", text: $list)
                Button {
                    
                    now.append(list)
                    list = ""
                } label: {
                    Text("Confirm")
                }
                List {
                    ForEach(now, id: \.self) {
                        value in
                        Text(value)
                            .swipeActions {
                                Button{
                                    now.remove(at: (now.firstIndex(of: value))!)
                                } label: {
                                    HStack {
                                        Image(systemName: "trash")
                                    }
                                }
                            }
                            .tint(Color(red: 1, green: 0, blue: 0))
                        
                    }
                    Button(role: .destructive) {
                        now.removeAll()
                        times = 0
                    } label: {
                        Text("Remove all")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TodoList()
}
