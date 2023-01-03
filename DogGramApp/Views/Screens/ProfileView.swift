//
//  ProfileView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 03.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var profileDisplayName: String
    var profileUserID: String
    var isMyProfile: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            
            Divider()
            
            ImageGridView(posts: PostArrayObject())
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button {
            // action here
        } label: {
            Image(systemName: "line.horizontal.3")
        }
            .accentColor(Color.MyTheme.purpleColor)
            .opacity(isMyProfile ? 1.0 : 0.0)
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe Black", profileUserID: "", isMyProfile: true)
        }
    }
}
