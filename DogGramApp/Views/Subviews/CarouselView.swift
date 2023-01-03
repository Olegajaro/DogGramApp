//
//  CarouselView.swift
//  DogGramApp
//
//  Created by Олег Федоров on 02.01.2023.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection = 0
    @State var timerAdded = false
    private let maxCount = 8
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(1..<8) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 300)
        .animation(.default)
        .onAppear {
            guard !timerAdded else { return }
            addTimer()
        }
    }
    
    // MARK: - Functions
    private func addTimer() {
        timerAdded = true
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if selection == maxCount - 1 {
                selection = 0
            } else {
                selection += 1
            }
        }
        
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
