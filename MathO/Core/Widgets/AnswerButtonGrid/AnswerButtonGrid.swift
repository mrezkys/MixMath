//
//  SwiftUIView.swift
//  MixMath
//
//  Created by Muhammad Rezky on 14/10/24.
//

import SwiftUI

struct AnswerButtonGrid: View {
    let options: [Int]
    let stateProvider: (Int) -> AnswerButtonState
    let onSelect: (Int) -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<2) { row in
                HStack(spacing: 16) {
                    ForEach(0..<2) { col in
                        let index = (row * 2) + col
                        let option = options[index]
                        AnswerButtonRevamp(
                            generatedNumber: option,
                            state: stateProvider(index),
                            onTap: { onSelect(index) }
                        )
                    }
                }
                .padding(.horizontal, 32)
            }
        }
    }
}
