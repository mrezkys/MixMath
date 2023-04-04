//
//  HomeView.swift
//  MathO
//
//  Created by Vincent Gunawan on 30/03/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                // TODO: -Change illustration image
                Image("splashImage")
                    .resizable()
                    .scaledToFit()
                
                NavigationLink(destination: QuestionPage()) {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(Color("celestialBlue"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("celestialBlue"), lineWidth: 2)
                        )
                        .padding(.horizontal, 32)
                        .foregroundColor(Color.white)
                }
                .buttonStyle(PlainButtonStyle())
                
                HStack {
                    Text("Belum pernah bermain?")
                    // TODO: - Change destination view
                    NavigationLink(destination: OnboardingView()) {
                        Text("Tutorial")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("celestialBlue"))
                    }
                }
                .padding(.top, 32)
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
