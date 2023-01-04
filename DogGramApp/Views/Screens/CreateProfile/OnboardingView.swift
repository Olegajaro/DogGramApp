//
//  OnboardingView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 04.01.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @State var showOnboardingPart2 = false
    
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
                showOnboardingPart2.toggle()
            } label: {
                SignInWithAppleCustomButton()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            }
            
            Button {
                // Sign in with Google
                showOnboardingPart2.toggle()
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
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("CONTINUE AS GUEST")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            }
            .accentColor(.black)

        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingPart2) {
            OnboardingViewPart2()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
