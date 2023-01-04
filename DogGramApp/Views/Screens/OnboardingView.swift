//
//  OnboardingView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 04.01.2023.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
            
            Text("Welcome to DogGram!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("App description text.")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Button {
                // Sign in with AppleID
            } label: {
                SignInWithAppleCustomButton()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            }
            
            Button {
                // Sign in with Google
            } label: {
                HStack {
                    Image(systemName: "globe")
                    
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(.sRGB, red: 222 / 255, green: 82 / 255, blue: 70 / 255))
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
            }
            .accentColor(Color.white)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
