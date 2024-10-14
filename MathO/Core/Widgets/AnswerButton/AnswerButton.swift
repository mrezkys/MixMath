//
//  AnswerButton.swift
//  MixMath
//
//  Created by Muhammad Rezky on 14/10/24.
//

import SwiftUI

struct AnswerButtonRevamp: View {
    let generatedNumber: Int
    let state: AnswerButtonState
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text("\(generatedNumber)")
                .font(.system(size: 36, design: .rounded))
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    RoundedRectangle(cornerRadius: state.cornerRadius)
                        .fill(state.backgroundColor)
                        .animation(.easeIn(duration: 0.1))
                )
                .aspectRatio(1, contentMode: .fit)
        }
    }
}
