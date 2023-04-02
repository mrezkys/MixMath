//
//  QuestionPage.swift
//  MathO
//
//  Created by Vincent Gunawan on 30/03/23.
//

import SwiftUI

struct AnswerButton: View {
    let generatedNumber: Int
    @Binding var isCircle: [Bool]
    @Binding var isSelected: [Bool]
    let index: Int
    let correctAnswer: Int
    
    var body: some View {
        Button {
            withAnimation {
                if correctAnswer == generatedNumber {
                    isCircle[index].toggle()
                    isSelected[index].toggle()
                } else {
                    isSelected[index].toggle()
                }
            }
        } label: {
            Text("\(generatedNumber)")
                .font(.system(size: 36, design: .rounded))
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    RoundedRectangle(cornerRadius: isCircle[index] ? .infinity : 10)
                        .fill(isCircle[index] ? Color.green : isSelected[index] ? Color.red : Color.blue)
                        .scaleEffect(isCircle[index] ? 1.0 : 1.0)
                        .animation(.easeIn(duration: 0.1))
                )
                .foregroundColor(Color.white)
                .aspectRatio(1, contentMode: .fit)
        }
        .disabled(isCircle.contains(where: {
            $0 == true
        }) || isSelected.contains(where: {
            $0 == true
        }))
    }
}

struct QuestionPage: View {
    var question: [Math] = [Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math()]
    @State public var currentPageIndex: Int
    @State public var isCircle: [[Bool]] = Array(repeating: [false, false, false, false], count: 12)
    @State public var isSelected: [[Bool]] = Array(repeating: [false, false, false, false], count: 12)
    @State var showSummaryView: Bool = false
    
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
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[0], isCircle: $isCircle[currentPageIndex], isSelected: $isSelected[currentPageIndex], index: 0, correctAnswer: question[currentPageIndex].correctAnswer)
                    
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[1], isCircle: $isCircle[currentPageIndex], isSelected: $isSelected[currentPageIndex], index: 1, correctAnswer: question[currentPageIndex].correctAnswer)
                }
                .padding(.horizontal, 32)
                
                HStack(spacing: 16) {
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[2], isCircle: $isCircle[currentPageIndex], isSelected: $isSelected[currentPageIndex], index: 2, correctAnswer: question[currentPageIndex].correctAnswer)
                    
                    AnswerButton(generatedNumber: question[currentPageIndex].answerOption.answerOptions[3], isCircle: $isCircle[currentPageIndex], isSelected: $isSelected[currentPageIndex], index: 3, correctAnswer: question[currentPageIndex].correctAnswer)
                }
                .padding(.horizontal, 32)
            }
            
            Spacer()
        }
        .padding(.top, 35)
        .navigationBarTitle("Mari Berhitung 🤓")
        .navigationBarItems(trailing: Button(action: {
            if currentPageIndex < question.count-1 {
                currentPageIndex += 1
            } else {
                self.showSummaryView.toggle()
            }
        }, label: {
            if currentPageIndex < question.count-1 {
                Text("Next")
            } else {
                Text("Finish")
            }
            
        }))
        NavigationLink(
            destination: TestView(question: question, isCircle: isCircle, isSelected: isSelected),
            isActive: $showSummaryView
        ) {
            EmptyView()
        }
        //            .disabled(currentPageIndex == question.count-1))
    }
}

struct QuestionPage_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPage(currentPageIndex: 0)
    }
}
