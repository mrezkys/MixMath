//
//  OnboardingView.swift
//  MathO
//
//  Created by Vincent Gunawan on 29/03/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage: Int = 0
    @State private var isOnboardingComplete = false
    
    // MARK: - initializer for onboarding swipe not bouncing
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                        VStack{
                            // TODO: - Change illustration image & description
                            Image(onBoardingSteps[index].image)
                                .resizable()
                                .scaledToFit()
                            Text(onBoardingSteps[index].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                        if index == currentPage {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(Color("orangeColor"))
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 24)
                
                Button(action:{
                    if self.currentPage < onBoardingSteps.count - 1 {
                        self.currentPage += 1
                    } else {
                        self.isOnboardingComplete = true
                    }
                }) {
                    Text(currentPage < onBoardingSteps.count - 1 ? "Next" : "Get Started")
                        .padding(16)
                        .frame(minWidth: 215)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("orangeColor"), lineWidth: 2)
                        )
                        .padding(.horizontal, 16)
                        .foregroundColor(Color("orangeColor"))
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                    .frame(maxHeight: 100)
            }
            .background(Color("backgroundColor"))
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
