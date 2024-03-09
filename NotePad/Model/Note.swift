//
//  Note.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var content: String
    var createdAt: Date
    var about: Category?
    
    init(title: String, content: String, createdAt: Date, about: Category? = nil) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.about = about
    }
}
