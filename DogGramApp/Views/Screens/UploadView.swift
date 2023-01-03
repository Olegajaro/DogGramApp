//
//  UploadView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 03.01.2023.
//

import SwiftUI
import UIKit

struct UploadView: View {
    
    @State var showImagePicker = false
    @State var imageSelected = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showPostImageView = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button {
                    sourceType = .camera
                    showImagePicker.toggle()
                } label: {
                    Text("Take photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.yellowColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.purpleColor)
                
                Button {
                    sourceType = .photoLibrary
                    showImagePicker.toggle()
                } label: {
                    Text("Import photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.purpleColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.yellowColor)
            }
            .sheet(isPresented: $showImagePicker, onDismiss: segueToPostImageView) {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
            }
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
        }
        .fullScreenCover(isPresented: $showPostImageView) {
            PostImageView(imageSelected: $imageSelected)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: - Functions
    private func segueToPostImageView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
    
}

struct UploadVIEW_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
