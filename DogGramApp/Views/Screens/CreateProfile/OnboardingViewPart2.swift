//
//  OnboardingViewPart2.swift
//  DogGramApp
//
//  Created by Олег Федоров on 04.01.2023.
//

import SwiftUI

struct OnboardingViewPart2: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var displayName = ""
    @State var showImagePicker = false
    
    // For image picker
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(colorScheme == .light
                                 ? Color.MyTheme.yellowColor
                                 : Color.MyTheme.purpleColor)
            
            TextField("Add your name here...", text: $displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(colorScheme == .light
                            ? Color.MyTheme.beigeColor
                            : Color.MyTheme.purpleColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
                .padding(.horizontal)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Finish: Add profile picture")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light
                                ? Color.MyTheme.yellowColor
                                : Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .accentColor(colorScheme == .light
                         ? Color.MyTheme.purpleColor
                         : Color.MyTheme.yellowColor)
            .opacity(displayName != "" ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 1.0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colorScheme == .light
                    ? Color.MyTheme.purpleColor
                    : Color.MyTheme.yellowColor)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showImagePicker, onDismiss: createProfile) {
            ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
        }
    }
    
    // MARK: - Functions
    private func createProfile() {
        print("DEBUG: create profile")
    }
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPart2()
    }
}
