//
//  NoteListView.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import SwiftUI
import SwiftData

struct NoteListView: View {
 
  @Environment(\.modelContext) var modelContext
  @State private var path = NavigationPath()
   
  @State private var sortOrder = [SortDescriptor(\Note.createdAt)]
    

  @State private var searchText = ""
   
  var body: some View {
    NavigationStack(path: $path){
      NoteView(searchString: searchText, sortOrder: sortOrder)
        .navigationTitle("My Notes")
        .navigationDestination(for: Note.self) { note in
          EditNoteView(note: note, navigationPath: $path)
        }
        .toolbar{
          Menu("Sort",systemImage: "arrow.up.arrow.down"){
            Picker("Sort", selection: $sortOrder) {
              Text("Newest first")
                .tag([SortDescriptor(\Note.createdAt, order: .reverse)])
              Text("Oldest first")
                .tag([SortDescriptor(\Note.createdAt)])
            }
          }
           
          Button("Add Note", systemImage: "plus", action: addNote)
        }
        .searchable(text: $searchText)
    }
  }
   
   
   
  func addNote(){
    let note = Note(title: "", content: "", createdAt: .now)
      if !note.title.isEmpty || !note.content.isEmpty {
          modelContext.insert(note)
      }
//    modelContext.insert(note)
    path.append(note)
  }
}

#Preview {
//  do {
//    let previewer = try Previewer()
//     
//    return NoteListView()
//      .modelContainer(previewer.container)
//  } catch {
//    return Text("Failed to create preview: \(error.localizedDescription)")
//
//  }
    NoteListView()
        .modelContainer(for: Note.self)
}
