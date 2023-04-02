//
//  SumQuestionPage.swift
//  MathO
//
//  Created by Vincent Gunawan on 01/04/23.
//

import SwiftUI

struct SumQuestionPage: View {
    var question: [Math]
    @State public var currentPageIndex: Int
    @State public var isCircle: [Bool]
    @State public var isSelected: [Bool]
    
    var body: some View {
        VStack {
            var _ = print(question)
            Text(question[currentPageIndex].stringQuestion)
                .padding(.horizontal, 10)
                .font(.system(size: 500))
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 240)
                .background(Color("orangeColor"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("orangeColor"), lineWidth: 2)
                )
                .padding(.horizontal, 32)
                .foregroundColor(Color.white)
            
            Spacer()
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[0], isCircle: $isCircle, isSelected: $isSelected, index: 0, correctAnswer: question[currentPageIndex].correctAnswer)
                    
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[1], isCircle: $isCircle, isSelected: $isSelected, index: 1, correctAnswer: question[currentPageIndex].correctAnswer)
                }
                .padding(.horizontal, 32)
                
                HStack(spacing: 16) {
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[2], isCircle: $isCircle, isSelected: $isSelected, index: 2, correctAnswer: question[currentPageIndex].correctAnswer)
                    
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[3], isCircle: $isCircle, isSelected: $isSelected, index: 3, correctAnswer: question[currentPageIndex].correctAnswer)
                }
                .padding(.horizontal, 32)
            }
            
            Spacer()
        }
        .padding(.top, 35)
        .navigationBarTitle("Lets Review 🤓")
    }
}

struct SumQuestionPage_Previews: PreviewProvider {
    static var previews: some View {
        SumQuestionPage(question: [Math()], currentPageIndex: 0, isCircle: [false, false, false, false], isSelected: [true, false, false, false])
    }
}
