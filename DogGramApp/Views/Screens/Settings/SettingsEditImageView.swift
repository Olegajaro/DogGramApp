//
//  SettingsEditImageView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 03.01.2023.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage // Image shown on this screen
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State var showImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(description)
                Spacer()
            }
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(12)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("IMPORT")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            }
            .accentColor(Color.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            }
            
            Button {
                
            } label: {
                Text("SAVE")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            }
            .accentColor(Color.MyTheme.yellowColor)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditImageView(title: "Test title",
                                  description: "This is description",
                                  selectedImage: UIImage(named: "dog1")!)
        }
    }
}
