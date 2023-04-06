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
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .top) {
                Color("celestialBlue")
                    .edgesIgnoringSafeArea(.bottom)
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 300)
                
                VStack {
                    TabView(selection: $currentPage) {
                        ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                            VStack {
                                Image(onBoardingSteps[index].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .ignoresSafeArea()
                                    .background(Color.white)
                                    .ignoresSafeArea()
                                VStack {
                                    Text(onBoardingSteps[index].title)
                                        .padding(.horizontal, 32)
                                        .font(.system(size: 28, weight: .bold, design: .rounded))
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.center)
                                        .bold()
                                        .padding(.bottom, 4)
                                        .foregroundColor(.white)
                                    Text(onBoardingSteps[index].description)
                                        .font(.system(size: 18))
                                        .multilineTextAlignment(.center)
                                        .lineSpacing(4)
                                        .padding(.horizontal, 16)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 40)
                                .frame(height: 160.0)
                                
                            }
                            .tag(index)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .animation(.linear)
                    .transition(.slide)
                    
                    VStack{
                        HStack {
                            ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                                if index == currentPage {
                                    Rectangle()
                                        .frame(width: 20, height: 6)
                                        .cornerRadius(10)
                                        .foregroundColor(Color("onboardGray"))
                                } else {
                                    Rectangle()
                                        .frame(width: 10, height: 6)
                                        .cornerRadius(10)
                                        .foregroundColor(Color("onboardGray"))
                                }
                            }
                        }
                        .padding(.bottom, 8)
                        
                        Button(action:{
                            if self.currentPage < onBoardingSteps.count - 1 {
                                self.currentPage += 1
                            } else {
                                self.isOnboardingComplete = true
                            }
                        }) {
                            Text(currentPage < onBoardingSteps.count - 1 ? "Saya Siap!" : "Saya Mengerti")
                                .foregroundColor(Color("celestialBlue"))
                                .padding(16)
                                .frame(minWidth: 215)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: HomeView(), isActive: $isOnboardingComplete) {
                            EmptyView()
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
