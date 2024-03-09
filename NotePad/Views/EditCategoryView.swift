//
//  EditCategoryView.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import SwiftUI
import SwiftData

struct EditCategoryView: View {
    
    @Bindable var category: Category
    
    
    var body: some View {
        Form{
            TextField("Category´s Name", text: $category.name)
            
        }
        .navigationTitle("Edit Ctegory")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditCategoryView(category: previewer.category)
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
