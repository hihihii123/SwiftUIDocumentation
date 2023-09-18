//
//  ContentView.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 18/9/23.
//

import SwiftUI
import SwiftPersistence

struct ContentView: View {
    @Persistent("now", store: .appStorage) var now = ["1"]
    @Persistent("time", store: .appStorage) var times = 0
    @State var list = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Placeholder code")
            TextField("Input here", text: $list)
            Button {
                times += 1
                list = "\(times). \(list)"
                now.append(list)
                list = ""
            } label: {
                Text("Confirm")
            }
            List {
                ForEach(now, id: \.self) {
                    value in
                    Text(value)
                        /*.swipeActions {
                            Button{
                                now.remove(at: )
                            } label: {
                                HStack {
                                    Text("Delete")
                                }
                            }
                        }
                         */
                }
                Button(role: .destructive) {
                    now.removeAll()
                    times = 0
                } label: {
                    Text("Remove all")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

