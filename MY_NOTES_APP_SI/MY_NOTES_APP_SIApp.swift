//
//  MY_NOTES_APP_SIApp.swift
//  MY_NOTES_APP_SI
//
//  Created by Bruno Marques on 30/11/24.
//

import SwiftUI
import SwiftData

@main
struct MY_NOTES_APP_SIApp: App {
    var body: some Scene {
        WindowGroup {
            MyNotesListView()
        }
        .modelContainer(for: NoteItem.self)
    }
}
