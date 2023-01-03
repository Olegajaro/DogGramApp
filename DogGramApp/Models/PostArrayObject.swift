//
//  PostArrayObject.swift
//  DogGramApp
//
//  Created by Олег Федоров on 02.01.2023.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        
        print("DEBUG: Fetch from data base here")
        
        let post1 = PostModel(postID: "", userID: "",
                              userName: "Joe Black", caption: "Test caption",
                              dateCreated: Date(), likeCount: 0,
                              likedByUser: false)
        
        let post2 = PostModel(postID: "", userID: "",
                              userName: "Ostin", caption: nil,
                              dateCreated: Date(), likeCount: 0,
                              likedByUser: false)
        
        let post3 = PostModel(postID: "", userID: "",
                              userName: "Amanda", caption: "This is long caption, lolololololololololollolololololololol",
                              dateCreated: Date(), likeCount: 0,
                              likedByUser: false)
        
        let post4 = PostModel(postID: "", userID: "",
                              userName: "Emily", caption: nil,
                              dateCreated: Date(), likeCount: 0,
                              likedByUser: false)
        
        dataArray.append(post1)
        dataArray.append(post2)
        dataArray.append(post3)
        dataArray.append(post4)
    }
    
    /// Used for single post selection
    init(post: PostModel) {
        dataArray.append(post)
    }
    
}
