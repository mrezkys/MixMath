//
//  ContentView.swift
//  MathO
//
//  Created by Vincent Gunawan on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var showContent = false
    
    var body: some View {
        if showContent {
            return AnyView(OnboardingView())
        } else {
            return AnyView(
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.showContent = true
                        }
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
