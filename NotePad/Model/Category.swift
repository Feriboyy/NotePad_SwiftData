//
//  Category.swift
//  NotePad
//
//  Created by Mehdi on 2024-02-25.
//

import Foundation
import SwiftData

@Model
class Category {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

