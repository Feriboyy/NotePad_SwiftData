//
//  NoteView.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    @Environment(\.modelContext) var modelContext
    @Query var text: [Note]

    var body: some View {
        List{
            ForEach(text){note in
                NavigationLink( value: note) {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                        Text(note.content)
                            .font(.subheadline)
                            .lineLimit(1) // Limiting to one line for content
                        Text(note.createdAt, style: .date)
                            .font(.caption)
                    }
                }
            }
            .onDelete(perform: deleteText)
            
        }
    }
    
    init (searchString: String = "", sortOrder: [SortDescriptor<Note>] = []) {
        _text = Query(filter: #Predicate { note in
            if searchString.isEmpty{
                true
            } else {
                note.title.localizedStandardContains(searchString)
                || note.content.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteText (at offsets: IndexSet){
        for offset in offsets {
            let note = text[offset]
            modelContext.delete(note)
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return NoteView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")

    }
}
