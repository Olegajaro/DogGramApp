//
//  SettingsEditTextView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 03.01.2023.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @Environment(\.colorScheme) var colorSheme
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Text(description)
                Spacer()
            }
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(colorSheme == .light
                            ? Color.MyTheme.beigeColor
                            : Color.MyTheme.purpleColor)
                .cornerRadius(12)
                .autocapitalization(.sentences)
            
            Button {
                
            } label: {
                Text("SAVE")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorSheme == .light
                                ? Color.MyTheme.purpleColor
                                : Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            }
            .accentColor(colorSheme == .light
                         ? Color.MyTheme.yellowColor
                         : Color.MyTheme.purpleColor)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "Test Title",
                                 description: "This is description",
                                 placeholder: "Placeholder")
        }
    }
}
