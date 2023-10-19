//
//  newToDo.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 19/9/23.
//

import SwiftUI

struct newToDo: View {
    @State var list = ""
    @State var date = Date()
    @Binding var nowS: Array<toDo>
    @Binding var now: Array<String>
    @Binding var bindednewsheeta: Bool
    var body: some View {
        List {
            TextField("Name", text: $list)
            DatePicker("Due Date", selection: $date)
            Button {
                nowS.append(toDo(name: list, Due: date, done: false, archive: false))
                now.append(list)
                list = ""
                bindednewsheeta = false
            } label: {
                Text("Confirm")
            }
        }
    }
}

#Preview {
    newToDo(nowS: .constant([toDo(name: "", Due: Date(), done: false, archive: false)]), now: .constant([""]), bindednewsheeta: .constant(true))
}
