//
//  SplashScreenView.swift
//  MathO
//
//  Created by Vincent Gunawan on 29/03/23.
//

import SwiftUI

struct SplashScreenView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack {
            Color("backgroundColor")
                .opacity(0.6)
                .ignoresSafeArea(.all)
            VStack{
                Image("splashImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
