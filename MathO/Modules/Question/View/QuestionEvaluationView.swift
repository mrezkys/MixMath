//
//  SumQuestionPage.swift
//  MathO
//
//  Created by Vincent Gunawan on 01/04/23.
//
import SwiftUI

struct QuestionEvaluationView: View {
    var question: QuestionPageModel
    @State private var selectedAnswerIndex: Int? = nil

    var body: some View {
        VStack {
            Text(question.mathQuestion.stringQuestion)
                .padding(.horizontal, 24)
                .font(.system(size: 500, weight: .bold))
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .frame(maxWidth: .infinity, maxHeight: 240)
                .background(Color("celestialBlue"))
                .cornerRadius(24)
                .padding([.top, .leading, .trailing], 24)
                .foregroundColor(.white)
            
            Spacer()
            
            AnswerButtonGrid(
                options: question.mathQuestion.answerOption.answerOptions,
                stateProvider: { index in
                    answerButtonState(for: index)
                },
                onSelect: { index in
                    handleAnswerSelection(at: index)
                }
            )
            
            Spacer()
        }
        .padding(.top, 35)
        .navigationBarTitle("Lets Review 🤓", displayMode: .inline)
    }
    
    private func answerButtonState(for index: Int) -> AnswerButtonState {
        if let selectedIndex = selectedAnswerIndex {
            return selectedIndex == index
                ? (selectedIndex == question.mathQuestion.answerOption.rightAnswerIndex ? .correct : .incorrect)
                : .unselected
        }
        return .unselected
    }

    private func handleAnswerSelection(at index: Int) {
        selectedAnswerIndex = index
    }
}

struct QuestionEvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleMath = Math(selectedPattern: ["+", "-", "*"])
        let exampleQuestion = QuestionPageModel(mathQuestion: exampleMath)
        QuestionEvaluationView(question: exampleQuestion)
    }
}
