//
//  WrapUpView.swift
//  MathO
//
//  Created by Petrus Sinaga on 05/04/23.
//

import SwiftUI

struct QuestionSolutionWrapUpView: View {
    var question: Math
    
    var body: some View {
        VStack {
            // Question Display
            VStack {
                Text(question.stringQuestion)
                    .font(.system(size: 500, weight: .bold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .foregroundColor(.white)
                    .padding(.top, 1)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("celestialBlue"))
            )
            .padding([.leading, .bottom, .trailing], 12)

            // Solution Steps
            ForEach(0..<question.solution.count, id: \.self) { i in
                VStack {
                    Text("Step \(i + 1): Selesaikan \(getOperatorPronounce(operation: question.solution[i].operationStep))")
                        .font(.system(size: 16, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                    Text(question.solution[i].operationStep)
                        .font(.system(size: 48, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 1)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("celestialBlue"))
                )
                .padding([.leading, .bottom, .trailing], 12)
            }

            // Final Result
            VStack {
                Text("Hasil Akhirnya adalah")
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                Text("\(question.correctAnswer)")
                    .font(.system(size: 56, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 1)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 63)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("celestialBlue"))
            )
            .padding([.leading, .bottom, .trailing], 12)
            Spacer()
        }
        .padding(10)
    }

    private func getOperatorPronounce(operation: String) -> String {
        let ops = operation.components(separatedBy: " ")[1]
        switch ops {
        case "x": return NSLocalizedString("Perkalian", comment: "Pronunciation for multiplication operator")
        case ":": return NSLocalizedString("Pembagian", comment: "Pronunciation for division operator")
        case "+": return NSLocalizedString("Pertambahan", comment: "Pronunciation for addition operator")
        case "-": return NSLocalizedString("Pengurangan", comment: "Pronunciation for subtraction operator")
        default: return ""
        }
    }
}

struct QuestionSolutionWrapUpView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            QuestionSolutionWrapUpView( question: Math())
        }
    }
}
