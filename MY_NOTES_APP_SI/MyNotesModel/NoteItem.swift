//
//  NoteItem.swift
//  MY_NOTES_APP_SI
//
//  Created by Bruno Marques on 30/11/24.
//

import Foundation
import SwiftData

@Model
class NoteItem {
    let id: UUID
    var name: String
    var noteDescription: String
    var isCompleted: Bool
    
    init(name: String,
         noteDescription: String,
         isCompleted: Bool) {
        self.id = UUID()
        self.name = name
        self.noteDescription = noteDescription
        self.isCompleted = isCompleted
    }
    
    func toggle() {
        self.isCompleted.toggle()
    }
    
    func changeName(to name: String) {
        self.name = name
    }
    
    func changeDescription(to description: String) {
        self.noteDescription = description
    }
}

extension Bool: Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        !lhs && rhs
    }
}
