//
//  PostView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 01.01.2023.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    
    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            
            // MARK: - Header
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30, alignment: .center)
                .cornerRadius(15)
                
                Text(post.userName)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
            .padding(6)
            
            // MARK: - Image
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            // MARK: - Footer
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "heart")
                
                // MARK: - Comments Icon
                NavigationLink {
                    CommentsView()
                } label: {
                    Image(systemName: "bubble.middle.bottom")
                        .foregroundColor(.primary)
                }

                Image(systemName: "paperplane")
                
                Spacer()
            }
            .font(.title3)
            .padding(6)
            
            if let caption = post.caption {
                HStack {
                    Text(caption)
                    Spacer(minLength: 0)
                }
                .padding(6)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "",
                                           userName: "Joe Black", caption: "Test caption",
                                           dateCreated: Date(), likeCount: 0,
                                           likedByUser: false)
    
    static var previews: some View {
        PostView(post: post)
            .previewLayout(.sizeThatFits)
    }
}
