//
//  MessageView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 02.01.2023.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            
            // MARK: - Profile image
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                // MARK: - Username
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: - Comment
                Text(comment.content)
                    .padding(10)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    
    static var comment = CommentModel(commentID: "", userID: "",
                                      username: "Joe Black",
                                      content: "This is photo is really cool",
                                      dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
