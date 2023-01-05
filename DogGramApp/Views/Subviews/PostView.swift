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
    @State var postImage = UIImage(named: "dog1")!
    
    @State var animateLike = false
    @State var addHeartAnimationToView: Bool
    
    @State var showActionSheet = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
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
                    
                    Button {
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    }
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionSheet) {
                        getActionSheet()
                    }
                }
                .padding(6)
            }
            
            // MARK: - Image
            ZStack {
                Image(uiImage: postImage)
                    .resizable()
                .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            // MARK: - Footer
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    // MARK: - Like button
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
                    
                    // MARK: - Share Button
                    Button {
                        sharePost()
                    } label: {
                        Image(systemName: "paperplane")
                    }
                    .accentColor(.primary)

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
    
    private func getActionSheet() -> ActionSheet {
        switch actionSheetType {
        case .general:
            return ActionSheet(title: Text("What would you like to do?"), buttons: [
                .destructive(Text("Report"), action: {
                    actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                }),
                .default(Text("Learn more..."), action: {
                    print("DEBUG: learn more pressed")
                }),
                .cancel()
            ])
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), buttons: [
                .destructive(Text("This is inappropriate"), action: {
                    reportPost(reason: "This is inappropriate")
                }),
                .destructive(Text("This is spam"), action: {
                    reportPost(reason: "This is spam")
                }),
                .destructive(Text("It made me uncomfortable"), action: {
                    reportPost(reason: "It made me uncomfortable")
                }),
                .cancel {
                    actionSheetType = .general
                }
            ])
        }
    }
    
    private func reportPost(reason: String) {
        print("DEBUG: report post now")
    }
    
    private func sharePost() {
        let message = "Check out this post on DogGram!"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityVC = UIActivityViewController(activityItems: [message, image, link],
                                                  applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        DispatchQueue.main.async {
            viewController?.present(activityVC, animated: true)
        }
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
