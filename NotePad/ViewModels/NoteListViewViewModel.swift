//
//  NoteListViewViewModel.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import Foundation
import SwiftUI

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var searchText: String = ""
    @Published var sortOrder: [SortDescriptor<Note>] = [SortDescriptor(\Note.createdAt)]
    @State private var path = NavigationPath()

//    func loadData() {
//        // Fetch data from the model or service layer (replace with your implementation)
//        notes = [
//            Note(title: "Note 1", content: "This is the first note.", createdAt: Date()),
//            Note(title: "Note 2", content: "This is the second note.", createdAt: Date().addingTimeInterval(-100000)) // Added a note with an older date for sorting
//        ]
//    }

//    func addNote(){
//      let note = Note(title: "", content: "", createdAt: .now)
//      modelContext.insert(note)
//      path.append(note)
//    }

//    func searchNotes(text: String) {
//        // Implement search logic based on text (replace with your implementation)
//        if text.isEmpty {
//            loadData() // Reload all notes if no search text
//        } else {
//            // Filter notes based on search criteria
//            notes = notes.filter {
//                $0.title.lowercased().contains(text.lowercased()) ||
//                    $0.content.lowercased().contains(text.lowercased())
//            }
//        }
//    }
}
