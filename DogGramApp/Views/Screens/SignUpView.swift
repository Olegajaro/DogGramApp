//
//  SignUpView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 04.01.2023.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("You're not signed in! 🙁")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("Click the button below to create an account and join the fun!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Button {
                
            } label: {
                Text("SIGN IN / SIGN UP")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            }
            .accentColor(Color.MyTheme.yellowColor)
            
            Spacer()
            Spacer()
        }
        .padding(40)
        .background(Color.MyTheme.yellowColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
