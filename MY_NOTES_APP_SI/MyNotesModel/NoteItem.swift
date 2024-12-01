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
    var isCompleted: Bool
    
    init(name: String,
         isCompleted: Bool) {
        self.id = UUID()
        self.name = name
        self.isCompleted = isCompleted
    }
}

extension Bool: Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        !lhs && rhs
    }
}
