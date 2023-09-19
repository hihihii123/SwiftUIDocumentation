//
//  newToDo.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 19/9/23.
//

import SwiftUI

struct newToDo: View {
    @State var list = ""

    @Binding var nowS: Array<toDo>
    @Binding var now: Array<String>
    var body: some View {
        List {
            TextField("Input here", text: $list)
            Button {
                
                now.append(list)
                list = ""
            } label: {
                Text("Confirm")
            }
        }
    }
}

#Preview {
    newToDo(nowS: .constant([toDo(name: "", Due: Date(), done: false, archive: false)]), now: .constant([""]))
}
