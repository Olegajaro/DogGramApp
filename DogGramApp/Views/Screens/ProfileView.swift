//
//  ProfileView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 03.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var profileDisplayName: String
    @State var showSetting = false
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
            showSetting.toggle()
        } label: {
            Image(systemName: "line.horizontal.3")
        }
            .accentColor(colorScheme == .light
                         ? Color.MyTheme.purpleColor
                         : Color.MyTheme.yellowColor)
            .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(isPresented: $showSetting) {
            SettingsView()
                .preferredColorScheme(colorScheme)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe Black", profileUserID: "", isMyProfile: true)
        }
    }
}
