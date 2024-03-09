//
//  NotePadApp.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import SwiftUI
import SwiftData

@main
struct NotePadApp: App {
    var body: some Scene {
        WindowGroup {
            NoteListView()
        }
        .modelContainer(for: Note.self)
    }
}
