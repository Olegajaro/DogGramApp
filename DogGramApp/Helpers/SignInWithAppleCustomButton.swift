//
//  SignInWithAppleCustomButton.swift
//  DogGramApp
//
//  Created by Олег Федоров on 04.01.2023.
//

import AuthenticationServices
import SwiftUI

struct SignInWithAppleCustomButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default,
                                            authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) { }
    
}
