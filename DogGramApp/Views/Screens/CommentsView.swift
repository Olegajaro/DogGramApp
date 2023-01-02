//
//  CommentsView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 02.01.2023.
//

import SwiftUI

struct CommentsView: View {
    
    @State var submissionText = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here...", text: $submissionText)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .accentColor(Color.MyTheme.purpleColor)
            }
            .padding(6)
        }
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getComments()
        }
    }
    
    // MARK: - Functions
    private func getComments() {
        print("DEBUG: get comments from Database")
        
        let comment1 = CommentModel(commentID: "", userID: "", username: "Joe Black",
                                    content: "This is the first comment", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Ostin",
                                    content: "This is the second comment", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Amanda",
                                    content: "This is the third comment", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "Emily",
                                    content: "This is the fourth comment", dateCreated: Date())
        
        commentArray.append(comment1)
        commentArray.append(comment2)
        commentArray.append(comment3)
        commentArray.append(comment4)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
