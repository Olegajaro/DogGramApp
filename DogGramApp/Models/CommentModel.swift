//
//  CommentModel.swift
//  DogGramApp
//
//  Created by Олег Федоров on 02.01.2023.
//

import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID for the comment in the Database
    var userID: String // ID for the User in the Database
    var username: String // Username for the user in the Database
    var content: String // Actually comment text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
