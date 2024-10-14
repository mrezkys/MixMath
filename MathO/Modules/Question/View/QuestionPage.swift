//
//  QuestionPage.swift
//  MathO
//
//  Created by Vincent Gunawan on 30/03/23.
//

import SwiftUI

struct QuestionPage: View {
    @State private var questions: [QuestionPageModel]
    @State private var currentQuestionIndex: Int = 0
    @State private var showSummaryView: Bool = false
    @State private var showHelpButton: Bool = false
    @State private var needsHelp: Bool = false
    
    init() {
        let patterns = MathPattern().GeneratePatternByML()
        self._questions = State(initialValue: QuestionPageModel.generateQuestions(from: patterns))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                AnswerProgressBar(
                    answerCorrectly: questions.map { $0.isCorrect },
                    questionCount: questions.count
                )
                VStack {
                    questionView

                    NavigationLink(
                        destination: SolutionView(question: questions[currentQuestionIndex].mathQuestion),
                        isActive: $needsHelp
                    ) {
                        EmptyView()
                    }

                    AnswerButtonGrid(
                        options: questions[currentQuestionIndex]
                            .mathQuestion
                            .answerOption
                            .answerOptions,
                        stateProvider: { index in
                            answerButtonState(for: index)
                        },
                        onSelect: { index in
                            showHelpButton = true
                            handleAnswerSelection(at: index)
                        }
                    )
                    .padding(.top, 32)
                    
                    Spacer()
                    
                    Image("book-illustration")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 42)
                }
            }
        }
        .navigationBarTitle("Mari Berhitung 🤓")
        .navigationBarItems(trailing: nextButton)
    }
    
    private var questionView: some View {
        ZStack(alignment: .bottom) {
            Text(questions[currentQuestionIndex].mathQuestion.stringQuestion)
                .padding(.horizontal, 24)
                .font(.system(size: 500, weight: .bold))
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .frame(maxWidth: .infinity, maxHeight: 240)
                .background(Color("celestialBlue"))
                .cornerRadius(24)
                .padding([.top, .leading, .trailing], 24)
                .foregroundColor(.white)
            
            if showHelpButton {
                Button {
                    needsHelp.toggle()
                } label: {
                    Text("Bantuan")
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .foregroundColor(Color("celestialBlue"))
                        .background(Color.white)
                        .cornerRadius(16)
                }
                .padding(16)
            }
        }
    }
    
    private var nextButton: some View {
        Button(action: goToNextQuestion) {
            Text(currentQuestionIndex < questions.count - 1 ? "Lanjut" : "Selesai")
        }
        .disabled(questions[currentQuestionIndex].selectedAnswerIndex == nil)
        .disabled(needsHelp)
    }
    
    private func answerButtonState(for index: Int) -> AnswerButtonState {
        let question = questions[currentQuestionIndex]
        guard let selectedIndex = question.selectedAnswerIndex else { return .unselected }
        return selectedIndex == index
        ? (question.isCorrect ?? false ? .correct : .incorrect)
        : .unselected
    }
    
    private func handleAnswerSelection(at index: Int) {
        withAnimation {
            questions[currentQuestionIndex].selectedAnswerIndex = index
        }
    }
    
    private func goToNextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            showHelpButton = false
            currentQuestionIndex += 1
        } else {
            showSummaryView.toggle()
        }
    }
}

struct QuestionPage_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPage()
    }
}


struct AnswerButton: View {
    let generatedNumber: Int
    @Binding var isCircle: [Bool]
    @Binding var isSelected: [Bool]
    var pattern: String = ""
    let index: Int
    let correctAnswer: Int
    @Binding var answerCorrectly: [Bool?]
    let currentPageIndex: Int
    
    @ObservedObject var patternViewModel = PatternViewModel()
    var body: some View {
        Button {
            withAnimation {
                if correctAnswer == index {
                    isCircle[index].toggle()
                    isSelected[index].toggle()
                    if(currentPageIndex != -1){
                        if pattern != ""{
                            patternViewModel.addPattern(PatternAnswerModel(pattern: pattern, value: 1.0))
                        }
                        answerCorrectly[currentPageIndex] = true
                    }
                } else {
                    isSelected[index].toggle()
                    if(currentPageIndex != -1){
                        if pattern != ""{
                            patternViewModel.addPattern(PatternAnswerModel(pattern: pattern, value: -1.0))
                        }
                        answerCorrectly[currentPageIndex] = false
                    }
                }
            }
        } label: {
            Text("\(generatedNumber)")
                .font(.system(size: 36, design: .rounded))
                .bold()
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    RoundedRectangle(cornerRadius: isCircle[index] ? .infinity : 24)
                        .fill(isCircle[index] ? Color("americanGreen") : isSelected[index] ? Color("fireOpal") : Color("water"))
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
