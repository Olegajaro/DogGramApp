//
//  SettingsView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 03.01.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: - Section 1: DogGram
                GroupBox {
                    HStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                        
                        Text("Welcome message for app. Random text olololololololololoololo.")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "DogGram",
                                      labelImage: "dot.radiowaves.left.and.right")
                }
                .padding(.bottom, 20)
                
                // MARK: - Section 2: Profile
                GroupBox {
                    SettingsRowView(leftIcon: "pencil",
                                    text: "Display name",
                                    color: Color.MyTheme.purpleColor)
                    
                    SettingsRowView(leftIcon: "text.quote",
                                    text: "Bio",
                                    color: Color.MyTheme.purpleColor)
                    
                    SettingsRowView(leftIcon: "photo",
                                    text: "Profile picture",
                                    color: Color.MyTheme.purpleColor)
                    
                    SettingsRowView(leftIcon: "figure.walk",
                                    text: "Sign Out",
                                    color: Color.MyTheme.purpleColor)
                } label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person.fill")
                }
                .padding(.bottom, 20)
                
                // MARK: - Section 3: Application
                GroupBox {
                    SettingsRowView(leftIcon: "folder.fill",
                                    text: "Privacy policy",
                                    color: Color.MyTheme.yellowColor)
                    
                    SettingsRowView(leftIcon: "folder.fill",
                                    text: "Terms & Conditions",
                                    color: Color.MyTheme.yellowColor)
                    
                    SettingsRowView(leftIcon: "globe",
                                    text: "DogGram's Website",
                                    color: Color.MyTheme.yellowColor)
                } label: {
                    SettingsLabelView(labelText: "Application",
                                      labelImage: "apps.iphone")
                }
                .padding(.bottom, 20)
                
                // MARK: - Section 4: Sign off
                GroupBox {
                    Text("DogGram was made with love. \nAll Rights Reserved \nCopyright 1984 ❤️")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 40)

            }
            .padding()
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title3)
            })
                .accentColor(.primary))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
