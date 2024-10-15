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
            VStack (spacing: 16){
                Image("boy-main-illustration")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .padding(.top, 16)
                
                NavigationLink(destination: QuestionsView()) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                        .background(Color("celestialBlue"))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                }
                .buttonStyle(PlainButtonStyle())
                
                HStack {
                    Text("Belum pernah bermain?")
                    NavigationLink(destination: TutorialView()) {
                        Text("Tutorial")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("celestialBlue"))
                    }
                }
                .padding(.top, 32)
                
                Spacer()
                
                Image("book-illustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 24)
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
