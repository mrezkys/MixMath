//
//  TutorialFinishView.swift
//  MathO
//
//  Created by Aqilla Julia Chandra on 06/04/23.
//

import SwiftUI

struct TutorialFinishView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Circle()
                    .foregroundColor(Color("water"))
                    .frame(width: 430)
                
            }
            .ignoresSafeArea()
            .offset(y:120)
            
            VStack {
                Spacer().frame(height:262)
                Text("Kamu Keren!")
                    .multilineTextAlignment(.center)
                    .font(.custom("", size: 32))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("forestGreen"))
                    .fontDesign(.rounded)
                
                Spacer().frame(height: 14)
                Text("Kamu sudah paham cara bermain aplikasi ini. Mari kita mulai belajar operasi hitung campuran.")
                    .multilineTextAlignment(.center)
                    .font(.custom("SFPro", size: 20))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .padding(.horizontal, 40)
                Spacer()
                
                Image("girl-smile-illlustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 320, idealWidth: 320, maxWidth: 320, minHeight: 280, idealHeight: 280, maxHeight: 280, alignment: .center)
                    .padding(.horizontal, 33)
                    .ignoresSafeArea()
                    .offset(y: 35)
                
                
                //            Spacer()
                
            }
        }
        //        .padding()
    }
}


struct TutorialFinishView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFinishView()
    }
}
