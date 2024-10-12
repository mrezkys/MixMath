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

    private var buttonLabel: String {
        currentPage < onboardingStepsData.count - 1 ? "Saya Siap!" : "Saya Mengerti"
    }

    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $currentPage) {
                    ForEach(0..<onboardingStepsData.count, id: \.self) { index in
                        VStack (spacing: 0){
                            Image(onboardingStepsData[index].image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                                .frame(height: UIScreen.main.bounds.height * 0.55, alignment: .bottomLeading)
                                .background(Color.white)
                            VStack {
                                Spacer()
                                Text(onboardingStepsData[index].title)
                                    .padding(.horizontal, 32)
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 4)
                                    .foregroundColor(.white)
                                Text(onboardingStepsData[index].description)
                                    .font(.system(size: 18))
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(4)
                                    .padding(.horizontal, 16)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .background(Color("celestialBlue"))
                        .tag(index)
                    }
                }
                .frame(maxWidth: .infinity)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.none, value: 1)
                .transition(.slide)
                
                VStack{
                    HStack {
                        ForEach(0..<onboardingStepsData.count, id: \.self) { index in
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
                    Button {
                        if self.currentPage < onboardingStepsData.count - 1 {
                            withAnimation {
                                self.currentPage += 1
                            }
                        } else {
                            self.isOnboardingComplete = true
                        }
                        
                    } label: {
                        Text(buttonLabel)
                            .foregroundColor(Color("celestialBlue"))
                            .padding(16)
                            .frame(minWidth: 215)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 8)
                    
                    NavigationLink(destination: HomeView(), isActive: $isOnboardingComplete) {
                        EmptyView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("celestialBlue"))
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
