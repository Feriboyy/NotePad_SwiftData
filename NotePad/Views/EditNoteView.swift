//
//  NewNoteView.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import SwiftUI
import SwiftData

struct EditNoteView: View {
    @Environment(\.modelContext) var modelContext
    
    @Bindable var note: Note
    @Binding var navigationPath: NavigationPath
    @StateObject var viewModel = EditNoteViewViewModel()
    @Query var categories: [Category]
    
    
    
    
    var body: some View {
        Form{
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(Color.red)
            }
            
            Section("Title"){
                TextField("Write a title", text: $note.title)
            }
            
            Section("What is the note about?"){
                Picker("This note is About",selection: $note.about){
                    Text("General")
                        .tag(Optional<Category>.none)
                    
                    if categories.isEmpty == false {
                        Divider()
                        
                        ForEach(categories){ category in
                            Text(category.name)
                                .tag(Optional(category))
                        }
                    }
                }
                
                Button("Add a new category", action: addCategory)
            }
            
            Section("Content"){
                TextEditor(text: $note.content)
            }
        }
        .navigationTitle("Edit Note")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Category.self){ category in
            EditCategoryView(category: category)
        }
    }

    func addCategory(){
        let category = Category(name: "")
        modelContext.insert(category)
        navigationPath.append(category)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditNoteView(note: previewer.note, navigationPath: .constant(NavigationPath()))
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}



