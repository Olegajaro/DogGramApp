//
//  FeedView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 01.01.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            PostView()
            PostView()
            PostView()
            PostView()
            PostView()
        }
        .navigationTitle("FEED VIEW")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView()
        }
    }
}
