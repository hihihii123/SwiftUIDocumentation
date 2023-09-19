//
//  mainFile.swift
//  SwiftUIDocumentation
//
//  Created by Ang Sen Luen Matthias on 19/9/23.
//

import Foundation
import SwiftPersistence


struct toDo: Codable {
    var name: String
    var Due: Date
    var done: Bool
    var archive: Bool
    var ExtraVar: String?
    var ExtraVarDone: Bool?
}

