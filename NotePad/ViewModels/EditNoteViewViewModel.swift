//
//  NewNoteViewViewModel.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import Foundation

class EditNoteViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var content = ""
    @Published var errorMessage = ""
    
    
    
    private func validate() -> Bool {
        errorMessage = ""
        guard title.isEmpty,
              content.isEmpty else {
            
            errorMessage = "Please fill in all fields"
            return false
        }
        
        return true
    }
}


