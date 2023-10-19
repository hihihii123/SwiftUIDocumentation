//
//  TodoList.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 19/9/23.
//

import SwiftUI
import SwiftPersistence

struct TodoList: View {
    @Persistent("nowS", store: .fileManager) var nowS = [toDo(name: "finish this app", Due: Date(timeIntervalSince1970: TimeInterval(1)), done: false, archive: false)]
    @Persistent("now", store: .fileManager) var now = ["finish this app"]

    @Persistent("time", store: .appStorage) var times = 0
    @State var sheetA = false
    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    ForEach(now, id: \.self) {
                        
                        value in
                        
                        HStack {
                            
                            Button {
                                nowS[now.firstIndex(of: value)!].done = (nowS[now.firstIndex(of: value)!].done) ? false : true
                            } label: {
                                Image(systemName: ((nowS[now.firstIndex(of: value)!].done) ? "checkmark.square" : "square"))
                            }
                            
                            
                            NavigationLink {
                                let valueeee = value
                                todoview(now: $now,  bindedNowS: $nowS, bindedvalueeeee: .constant(valueeee))
                                
                            } label: {
                                Text(value)
                            }
                            .swipeActions {
                                Button{
                                    if let valuee = now.firstIndex(of: value) {
                                        nowS[valuee].archive = true
                                    }
                                    now.remove(at: (now.firstIndex(of: value))!)
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: "archivebox")
                                    }
                                }
                            }
                            .tint(Color(red: 0, green: 0.6, blue: 0.2))
                            
                            
                        }
                        
                        
                        
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
            .navigationTitle("Todo list")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        archivedToDo()
                    } label: {
                        Image(systemName: "archivebox")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetA = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        
        .sheet(isPresented: $sheetA) {
            newToDo(nowS: $nowS, now: $now, bindednewsheeta: $sheetA)
        }
        
        
    }
}

#Preview {
    TodoList()
}
