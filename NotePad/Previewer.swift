//
//  Previewer.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let category: Category
    let note: Note
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Note.self, configurations: config)
        
        category = Category(name: "General")
        note = Note(title: "note1", content: "description", createdAt: .now)
        
        container.mainContext.insert(note)
    }
    
    init(container: ModelContainer, category: Category, note: Note) {
        self.container = container
        self.category = category
        self.note = note
    }
    
}

