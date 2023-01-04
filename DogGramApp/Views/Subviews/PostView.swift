//
//  PostView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 01.01.2023.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    
    @State var animateLike = false
    @State var addHeartAnimationToView: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            
            // MARK: - Header
            if showHeaderAndFooter {
                HStack {
                    NavigationLink {
                        ProfileView(profileDisplayName: post.userName,
                                    profileUserID: post.userID,
                                    isMyProfile: false)
                    } label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(15)
                        
                        Text(post.userName)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }

                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(6)
            }
            
            // MARK: - Image
            ZStack {
                Image("dog1")
                    .resizable()
                .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            // MARK: - Footer
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Button {
                        if post.likedByUser {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    } label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                    }
                    .accentColor(post.likedByUser ? .red : .primary)

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
    
    // MARK: - Functions
    private func likePost() {
        // update locale data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID,
                                    userName: post.userName, caption: post.caption,
                                    dateCreated: post.dateCreated,likeCount: post.likeCount + 1,
                                    likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
    }
    
    private func unlikePost() {
        // update locale data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID,
                                    userName: post.userName, caption: post.caption,
                                    dateCreated: post.dateCreated,likeCount: post.likeCount - 1,
                                    likedByUser: false)
        self.post = updatedPost
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "",
                                           userName: "Joe Black", caption: "Test caption",
                                           dateCreated: Date(), likeCount: 0,
                                           likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
