//
//  DogGramApp.swift
//  DogGramApp
//
//  Created by Олег Федоров on 01.01.2023.
//

import FirebaseCore
import SwiftUI

@main
struct DogGramApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
