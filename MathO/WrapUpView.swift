//
//  WrapUpView.swift
//  MathO
//
//  Created by Petrus Sinaga on 05/04/23.
//

import SwiftUI

struct WrapUpView: View {
    var body: some View {
        ZStack {
            Color("SoftOrange")
            VStack {
            
                VStack {
                    Text("Step 1: Selesaikan perkalian")
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                    Text("1 + 6 x 3 - 1")
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                        .padding(.top, 1)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.orange)
                )
                .padding([.leading, .bottom, .trailing], 12)
                
                VStack {
                    Text("Step 2: Selesaikan penjumlahan")
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                    Text("1 + 18 - 1")
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                        .padding(.top, 1)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.orange)
                )
                .padding([.leading, .bottom, .trailing], 12)
                
                VStack {
                    Text("Step 3: Selesaikan Pengurangan")
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                    Text("19 - 1")
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                        .padding(.top, 1)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.orange)
                )
                .padding([.leading, .bottom, .trailing], 12)
                
                VStack {
                    Text("Hasil Akhirnya adalah")
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                    Text("18")
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                        .padding(.top, 1)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 63)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.orange)
                )
                .padding([.leading, .bottom, .trailing], 12)
                
                Spacer()
                    
            }
            .padding(10)
        }
    }
}

struct WrapUpView_Previews: PreviewProvider {
    static var previews: some View {
        WrapUpView()
    }
}
