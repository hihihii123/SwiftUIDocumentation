//
//  todoview.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 20/9/23.
//

import SwiftUI

struct todoview: View {
    @Binding var now: Array<String>

    @Binding var bindedNowS: Array<toDo>
    @Binding var bindedvalueeeee: String
    

    var body: some View {
        VStack {
            List {
                Text("Name: \(bindedNowS[now.firstIndex(of: bindedvalueeeee)!].name)")
                Text("Due Date: \((bindedNowS[now.firstIndex(of: bindedvalueeeee)!].Due))")
                if bindedNowS[now.firstIndex(of: bindedvalueeeee)!].done {
                    if bindedNowS[now.firstIndex(of: bindedvalueeeee)!].archive {
                        Text("Completed and archived")
                            .tint(Color.green)
                    } else {
                        Text("Completed but not archived")
                            .tint(Color.green)
                    }
                    
                } else {
                    if bindedNowS[now.firstIndex(of: bindedvalueeeee)!].archive {
                        Text("Incomplete but archived")
                            .tint(Color.red)
                    } else {
                        Text("Incomplete and not archived")
                            .tint(Color.red)
                    }
                }
                if bindedNowS[now.firstIndex(of: bindedvalueeeee)!].Due > Date() {
                    if bindedNowS[now.firstIndex(of: bindedvalueeeee)!].done {
                        Text("Complete")
                            .tint(Color.green)
                    } else {
                        Text("Incomplete")
                            .tint(Color.yellow)
                    }
                } else {
                    if bindedNowS[now.firstIndex(of: bindedvalueeeee)!].done {
                        Text("Complete")
                            .tint(Color.green)
                    } else {
                        Text("Overdue")
                            .bold()
                            .tint(Color.red)
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    todoview(now: .constant([""]), bindedNowS: .constant([toDo(name: "", Due: Date(), done: false, archive: false)]), bindedvalueeeee: .constant(""))
}
